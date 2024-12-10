# Create resource groups for the core infrastructure
module "azurerm_resource_group" {
    source  = "Azure/avm-res-resources-resourcegroup/azurerm"
    version = "0.1.0"
    for_each = { for idx, rg in var.resource_groups : idx => rg }

    name     = local.resource_groups_name[each.value.purpose]
    location = each.value.location
}

# Create Log Analytics workspaces
module "azurerm_log_analytics_workspace" {
    source  = "Azure/avm-res-operationalinsights-workspace/azurerm"
    version = "0.4.2"
    for_each = { for idx, law in var.log_analytics_workspaces : idx => law }

    name                = local.log_analytics_workspace_names[each.key]
    log_analytics_workspace_identity = "SystemAssigned"
    location            = each.value.location
    resource_group_name = module.azurerm_resource_group[each.value.resource_group_id].name
}
