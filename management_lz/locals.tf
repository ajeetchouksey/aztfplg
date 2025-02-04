locals {
  environment = var.environment
  landingzone_prefix = "m"
  resource_name_prefix = "tf"
  location_short             = "we"

  tags = {
    environment = var.environment
    landingzone= "management"
    project = "TF Playground" 
    last_updated = formatdate("YYYY-MM-DD", timestamp())
  }

  resource_groups_name = [
    for rg in var.resource_groups : {
    //  name = "${local.landingzone_prefix}-core-infra-rg-${local.environment}-${rg.id}"
    name = "${landingzone_prefix}-core-infra-${environment}-rg-${rg.id}"
      location = rg.location
    }
  ]
          
  log_analytics_workspace_names = [
    for  name in var.log_analytics_workspaces : {
      name = "${local.landingzone_prefix}-core-infra-law-${local.environment}-${name.id}"
    }   
  ]

  

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