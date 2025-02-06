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
          

  # List of virtual networks with their properties
  vnets = [
    for vnet in var.vnets : {
      # Construct the virtual network name using the landing zone prefix, environment, and virtual network ID
      name = "${var.landingzone_prefix}-ci-${var.environment}-vnet-${vnet.id}"
      location = vnet.location
      resource_group_name = element([for rg in local.resource_groups_name : rg.name], vnet.resource_group_id)
      address_space = vnet.address_space
      
    }
  ]       

}