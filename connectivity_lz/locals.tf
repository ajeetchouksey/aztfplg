locals {
  environment = var.environment
  landingzone_prefix = "c"
  resource_groups_name = {
    ct_infra_rg = "${local.landingzone_prefix}-ct-infra-rg-${local.environment}-01"  
    # add more resource groups here
  }

  ct_infra_vnets = {
    ct_infra_vnet = "${local.landingzone_prefix}-ct-infra-vnet-${local.environment}-01"    
    # add more vnets here
  }

  ct_infra_subnets = {
    pe_subnet = "${local.landingzone_prefix}-ct-infra-pe-subnet-${local.environment}-01"  
    res_subnet = "${local.landingzone_prefix}-ct-infra-res-subnet-${local.environment}-01"    
    # add more subnets here
  }

 
 

}