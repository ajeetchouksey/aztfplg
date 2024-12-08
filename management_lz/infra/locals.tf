locals {
  environment = var.environment
  landingzone_prefix = "m"
  resource_groups_name = {
    core_infra_rg = "${local.landingzone_prefix}-core-infra-rg-${local.environment}-01"  
    # add more resource groups here
  }

  core_infra_vnets = {
    core_infra_vnet = "${local.landingzone_prefix}-core-infra-vnet-${local.environment}-01"    
    # add more vnets here
  }

  core_infra_subnets = {
    pe_subnet = "${local.landingzone_prefix}-core-infra-pe-subnet-${local.environment}-01"  
    res_subnet = "${local.landingzone_prefix}-core-infra-res-subnet-${local.environment}-01"    
    # add more subnets here
  }

}