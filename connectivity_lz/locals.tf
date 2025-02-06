locals {
  # Tags to be applied to resources
  tags = {
    environment = var.environment
    landingzone = "connectivity"
    project = "TF Playground"
    last_updated = formatdate("YYYY-MM-DD", timestamp())
  }

  # List of resource group names and locations
  resource_groups_name = [
    for rg in var.resource_groups : {
      # Construct the resource group name using the landing zone prefix, environment, and resource group ID
      name = "${var.landingzone_prefix}-ci-${var.environment}-rg-${rg.id}"
      location = rg.location
    }
  ]
          
  # List of Log Analytics workspaces with their properties
  log_analytics_workspaces = [
    for law in var.log_analytics_workspaces : {
      # Construct the Log Analytics workspace name using the landing zone prefix, environment, and workspace ID
      name = "${var.landingzone_prefix}-ci-${var.environment}-la-${law.id}"
      location = var.location
      # Get the resource group name based on the resource group ID
      resource_group_name = element([for rg in local.resource_groups_name : rg.name], law.resource_group_id)
      log_analytics_workspace_sku = law.sku
      log_analytics_workspace_retention_in_days = law.retention_in_days
      log_analytics_workspace_internet_ingestion_enabled = law.log_analytics_workspace_internet_ingestion_enabled  
      log_analytics_workspace_internet_query_enabled = law.log_analytics_workspace_internet_query_enabled
      identity = law.identity
    }
  ]
}