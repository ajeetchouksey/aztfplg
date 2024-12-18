

module "container_apps_environment" {
    source = "git::https://github.com/Azure/terraform-azurerm-avm-res-app-managedenvironment.git?ref=9c3d0cf988096aa9df8f955f4ba1e960da74feda"
    
    for_each            = { for idx, app in var.container_apps_environment : idx => app }
    name                = each.value.container_app_environment_name
    location            = var.location
    resource_group_name = module.azurerm_resource_group[0].name
    enable_telemetry    = each.value.enable_telemetry

    log_analytics_workspace_primary_shared_key = each.value.log_analytics_workspace_primary_shared_key
    log_analytics_workspace_customer_id = each.value.log_analytics_workspace_customer_id
    log_analytics_workspace_destination = each.value.log_analytics_workspace_destination 

}
