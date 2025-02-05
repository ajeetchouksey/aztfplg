# Fetch details of the resource group created by the module
data "azurerm_resource_group" "all" {
    name = module.azurerm_resource_group[0].name
    depends_on = [module.azurerm_resource_group]
}

# Create Log Analytics workspaces
module "azurerm_log_analytics_workspace" {
    source = "git::https://github.com/Azure/terraform-azurerm-avm-res-operationalinsights-workspace.git?ref=1600b5831873ca127723368e35aba380a7e061e3"
   
    # Iterate over each log analytics workspace defined in the variable
    for_each = { for idx, law in local.log_analytics_workspaces : idx => {
        name = law.resource_group_name
        location = law.location
        sku = law.sku
        retention_in_days = law.retention_in_days
        log_analytics_workspace_internet_ingestion_enabled = law.log_analytics_workspace_internet_ingestion_enabled
        log_analytics_workspace_internet_query_enabled = law.log_analytics_workspace_internet_query_enabled
        identity = law.identity
        log_analytics_workspace_identity = {
            type = each.value.identity
        }
    }}

}

