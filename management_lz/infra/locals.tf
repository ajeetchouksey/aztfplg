locals {
  environment = var.environment
  landingzone_prefix = "m"

  resource_groups_name = [
    for rg in var.resource_groups : {
      name = "${local.landingzone_prefix}-core-infra-rg-${local.environment}-${rg.id}"
      location = rg.location
    }
  ]
           # add more resource groups here
  

  

  core_infra_vnets = {
    core_infra_vnet = "${local.landingzone_prefix}-core-infra-vnet-${local.environment}-01"    
    # add more vnets here
  }

  core_infra_subnets = {
    pe_subnet = "${local.landingzone_prefix}-core-infra-pe-subnet-${local.environment}-01"  
    res_subnet = "${local.landingzone_prefix}-core-infra-res-subnet-${local.environment}-01"    
    # add more subnets here
  }

  log_analytics_workspace_names = [for idx in range(length(var.log_analytics_workspaces)) : "${local.landingzone_prefix}-core-infra-law-${local.environment}-${idx}"]
 

}