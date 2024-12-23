


# Module to create Container Apps Environment
module "container_apps_environment" {
    source = "git::https://github.com/Azure/terraform-azurerm-avm-res-app-managedenvironment.git?ref=9c3d0cf988096aa9df8f955f4ba1e960da74feda"
    
    # Iterate over each container app environment defined in the variable
    for_each = { for idx, app in var.container_apps_environment : idx => app }
    
    # Define the name of the Container Apps Environment
    name = each.value.container_app_environment_name
    
    # Set the location for the Container Apps Environment
    location = var.location
    
    # Use the resource group fetched earlier
    resource_group_name = module.azurerm_resource_group[0].name
    
    # Enable or disable telemetry for the Container Apps Environment
    enable_telemetry = each.value.enable_telemetry

    # Set the Log Analytics workspace primary shared key
    log_analytics_workspace_primary_shared_key = each.value.log_analytics_workspace_primary_shared_key
    
    # Set the Log Analytics workspace customer ID
    log_analytics_workspace_customer_id = each.value.log_analytics_workspace_customer_id
    
    # Set the Log Analytics workspace destination
    log_analytics_workspace_destination = each.value.log_analytics_workspace_destination 
    
    # Enable or disable zone redundancy for the Container Apps Environment
    zone_redundancy_enabled = each.value.zone_redundancy_enabled
}
