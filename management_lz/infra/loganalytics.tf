
data "azurerm_resource_group" "rginfo" {
    for_each = { for idx, rg in var.resource_groups : idx => rg }

    name = local.resource_groups_name[each.value.purpose]
}

# Create Log Analytics workspaces
module "azurerm_log_analytics_workspace" {
    source  = "Azure/avm-res-operationalinsights-workspace/azurerm"
    # version = "0.4.2"
    for_each = { for idx, law in var.log_analytics_workspaces : idx => law }

    name                = local.log_analytics_workspace_names[each.key]
    location            = each.value.location
    log_analytics_workspace_sku = each.value.sku
    resource_group_name = data.azurerm_resource_group.rginfo[0].name
}