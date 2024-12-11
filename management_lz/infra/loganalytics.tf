
data "azurerm_resource_group" "rginfo" {
    for_each = { for idx, rg in var.resource_groups : idx => rg }

    name = each.key
}

# Create Log Analytics workspaces
 module "azurerm_log_analytics_workspace" {
    source = "git::https://github.com/Azure/terraform-azurerm-avm-res-operationalinsights-workspace.git?ref=1600b5831873ca127723368e35aba380a7e061e3"
    # version = "0.4.2"
    for_each = { for idx, law in var.log_analytics_workspaces : idx => law }

    name                = local.log_analytics_workspace_names[each.key]
    location            = each.value.location
    log_analytics_workspace_sku = each.value.sku
    resource_group_name = data.azurerm_resource_group.rginfo[0].name
    log_analytics_workspace_retention_in_days          = each.value.retention_in_days
    log_analytics_workspace_internet_ingestion_enabled = each.value.log_analytics_workspace_internet_ingestion_enabled
    log_analytics_workspace_identity = {
        type =each.value.identity
    }
    depends_on = [data.azurerm_resource_group.rginfo]
} 