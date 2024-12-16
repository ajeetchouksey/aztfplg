data "azurerm_resource_group" "all" {
    name = module.azurerm_resource_group[1].name
    depends_on = [ module.azurerm_resource_group ]
}
# Create Log Analytics workspaces
module "azurerm_log_analytics_workspace" {
    source = "git::https://github.com/Azure/terraform-azurerm-avm-res-operationalinsights-workspace.git?ref=1600b5831873ca127723368e35aba380a7e061e3"
   
    for_each = { for idx, law in var.log_analytics_workspaces : idx => law }

    name               = "${local.landingzone_prefix}-core-infra-${local.environment}-la-${each.value.id}"
    resource_group_name = data.azurerm_resource_group.all.name
    location            =  var.location  
    log_analytics_workspace_sku = each.value.sku
    log_analytics_workspace_retention_in_days          = each.value.retention_in_days
    log_analytics_workspace_internet_ingestion_enabled = each.value.log_analytics_workspace_internet_ingestion_enabled
    log_analytics_workspace_internet_query_enabled     = each.value.log_analytics_workspace_internet_query_enabled
    log_analytics_workspace_identity = {        
        type         = each.value.identity
    }   
}



