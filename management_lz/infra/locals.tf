locals {
  environment = var.environment
  landingzone_prefix = "m"
  resource_groups_name = { for rg in var.resource_groups : rg.name => "${local.landingzone_prefix}-${local.environment}-rg" }

}