# Fetch details of the resource group created by the module
data "azurerm_resource_group" "all" {
    name = module.azurerm_resource_group[0].name
    depends_on = [ module.azurerm_resource_group ]
}

# Create Log Analytics workspaces
module "azurerm_log_analytics_workspace" {
    source = "git::https://github.com/Azure/terraform-azurerm-avm-res-operationalinsights-workspace.git?ref=1600b5831873ca127723368e35aba380a7e061e3"
   
    # Iterate over each log analytics workspace defined in the variable
    for_each = { for idx, law in local.log_analytics_workspaces : idx => law }

    # Define the name of the Log Analytics workspace
    name = each.value.name
    
    # Use the resource group fetched earlier
    resource_group_name = data.azurerm_resource_group.all.name
    
    # Set the location for the Log Analytics workspace
    location = each.value.location
    
    # Set the SKU for the Log Analytics workspace
    log_analytics_workspace_sku = each.value.sku
    
    # Set the retention period for the Log Analytics workspace
    log_analytics_workspace_retention_in_days = each.value.retention_in_days
    
    # Enable or disable internet ingestion for the Log Analytics workspace
    log_analytics_workspace_internet_ingestion_enabled = each.value.log_analytics_workspace_internet_ingestion_enabled
    
    # Enable or disable internet query for the Log Analytics workspace
    log_analytics_workspace_internet_query_enabled = each.value.log_analytics_workspace_internet_query_enabled
    
    # Set the identity type for the Log Analytics workspace
    log_analytics_workspace_identity = {        
        type = each.value.identity
    }   
}

