# This module creates Log Analytics workspaces in Azure.

# Define the module for creating Log Analytics workspaces
module "azurerm_log_analytics_workspace" {
    # Source of the module, pointing to a specific commit in the GitHub repository
    source = "git::https://github.com/Azure/terraform-azurerm-avm-res-operationalinsights-workspace.git?ref=1600b5831873ca127723368e35aba380a7e061e3"

    # Iterate over each Log Analytics workspace defined in the local variable
    for_each = { for idx, law in local.log_analytics_workspaces : idx => law }

        # Name of the Log Analytics workspace
        name = each.value.name

        # Location where the Log Analytics workspace will be created
        location = each.value.location

        # Resource group in which the Log Analytics workspace will be created
        resource_group_name = each.value.resource_group_name

        # SKU (pricing tier) of the Log Analytics workspace
        log_analytics_workspace_sku = each.value.log_analytics_workspace_sku

        # Retention period (in days) for the Log Analytics workspace
        log_analytics_workspace_retention_in_days = each.value.log_analytics_workspace_retention_in_days

        # Enable or disable internet ingestion for the Log Analytics workspace
        log_analytics_workspace_internet_ingestion_enabled = each.value.log_analytics_workspace_internet_ingestion_enabled

        # Enable or disable internet query for the Log Analytics workspace
        log_analytics_workspace_internet_query_enabled = each.value.log_analytics_workspace_internet_query_enabled

        # Identity configuration for the Log Analytics workspace
        log_analytics_workspace_identity = {
            type = each.value.identity
        }
}
