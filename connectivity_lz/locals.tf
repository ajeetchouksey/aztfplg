locals {
  environment = var.environment
  landingzone_prefix = "c"
  resource_name_prefix = "tf"
  location_short             = "we"

  tags = {
    environment = var.environment
    landingzone= "connectivity"
    project = "TF Playground" 
    last_updated = formatdate("YYYY-MM-DD", timestamp())
  }

   resource_groups_name = [
    for rg in var.resource_groups : {
      name = "${local.landingzone_prefix}-core-infra-rg-${local.environment}-${rg.id}"
      location = rg.location
    }
  ]
 

}