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
          

}