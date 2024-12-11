/* 
data "azurerm_resource_group" "rginfo" {
    for_each = { for rg in local.resource_groups_name : rg.name => rg }

    name = each.key
}

# Create Log Analytics workspaces
module "azurerm_log_analytics_workspace" {
    source = "git::https://github.com/Azure/terraform-azurerm-avm-res-operationalinsights-workspace.git?ref=1600b5831873ca127723368e35aba380a7e061e3"
    for_each = { for idx, law in local.log_analytics_workspace_names : idx => law }

    name                = each.value.name
    location            = each.value.location
    log_analytics_workspace_sku = each.value.sku
    resource_group_name = data.azurerm_resource_group.rginfo[each.value.resource_group_id].name
    log_analytics_workspace_retention_in_days          = each.value.retention_in_days
    log_analytics_workspace_internet_ingestion_enabled = each.value.log_analytics_workspace_internet_ingestion_enabled
    log_analytics_workspace_internet_query_enabled     = each.value.log_analytics_workspace_internet_query_enabled
    log_analytics_workspace_identity = {
        identity_ids = ["43d09976-1ab4-462c-8d2d-c480d070cfa6"]
        type         = each.value.identity
    }
    depends_on = [data.azurerm_resource_group.rginfo]
} */