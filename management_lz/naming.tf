# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source                 = "Azure/naming/azurerm"
  version                = "0.3.0"
  suffix                 = [local.landingzone_prefix, local.resource_name_prefix, local.location_short]
  unique-include-numbers = true
}