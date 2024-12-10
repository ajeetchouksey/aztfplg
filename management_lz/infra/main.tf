# Create resource groups for the core infrastructure
# This module creates Azure Resource Groups using the Azure/avm-res-resources-resourcegroup/azurerm module.
# 
# Arguments:
# - source: Specifies the source of the module, which is "Azure/avm-res-resources-resourcegroup/azurerm".
# - version: Specifies the version of the module to use, which is "0.1.0".
# - for_each: Iterates over the local.resource_groups_name to create multiple resource groups.
# - name: The name of the resource group, derived from each value in local.resource_groups_name.
# - location: The location where the resource group will be created, specified by the var.location variable.
module "azurerm_resource_group" {
    source  = "Azure/avm-res-resources-resourcegroup/azurerm"
    version = "0.1.0"
    for_each = local.resource_groups_name

    name     = each.value
    location = var.location
}

# Create a Log Analytics workspace
# This module creates an Azure Log Analytics workspace using the Azure/avm-res-monitor-loganalytics/azurerm module.
#
# Arguments:
# - source: Specifies the source of the module, which is "Azure/avm-res-monitor-loganalytics/azurerm".
# - version: Specifies the version of the module to use, which is "0.1.0".
# - name: The name of the Log Analytics workspace, specified by the var.log_analytics_workspace_name variable.
# - location: The location where the Log Analytics workspace will be created, specified by the var.location variable.
# - resource_group_name: The name of the resource group where the Log Analytics workspace will be created, specified by the var.resource_group_name variable.
module "azurerm_log_analytics_workspace" {
    source  = "Azure/avm-res-operationalinsights-workspace/azurerm"
    version = "0.1.0"

    name                = var.log_analytics_workspace_name
    location            = var.location
    resource_group_name = var.resource_group_name
}