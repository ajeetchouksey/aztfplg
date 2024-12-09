locals {
  environment = var.environment
  landingzone_prefix = "m"
  resource_groups_name = {
    core_infra_rg = "${local.landingzone_prefix}-core-infra-rg-${local.environment}-01"
  #  app_infra_rg  = "${local.landingzone_prefix}-app-infra-rg-${local.environment}-01"
  
  }

}