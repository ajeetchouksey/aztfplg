locals {
 

  tags = {
    environment = var.environment
    landingzone= "management"
    project = "TF Playground" 
    last_updated = formatdate("YYYY-MM-DD", timestamp())
  }

  resource_groups_name = [
    for rg in var.resource_groups : {
    //  name = "${local.landingzone_prefix}-core-infra-rg-${local.environment}-${rg.id}"
      name = "${var.landingzone_prefix}-ci-${var.environment}-rg-${rg.id}"
      location = rg.location
    }
  ]
          
  log_analytics_workspaces = [
    for law in var.log_analytics_workspaces : {
      name = "${var.landingzone_prefix}-ci-${var.environment}-la-${law.id}"
      location = each.value.law.location
      resource_group_name = element([for rg in local.resource_groups_name : rg.name], law.resource_group_id)
      log_analytics_workspace_sku = each.value.law.sku
      log_analytics_workspace_retention_in_days = each.value.law.retention_in_days
      log_analytics_workspace_internet_ingestion_enabled = each.value.law.log_analytics_workspace_internet_ingestion_enabled  
      log_analytics_workspace_internet_query_enabled = each.value.law.log_analytics_workspace_internet_query_enabled
      identity = each.value.law.identity
      
    }
  ]

  

/*   core_infra_vnets = {
    core_infra_vnet = "${local.landingzone_prefix}-core-infra-vnet-${local.environment}-01"    
    # add more vnets here
  }

  core_infra_subnets = {
    pe_subnet = "${local.landingzone_prefix}-core-infra-pe-subnet-${local.environment}-01"  
    res_subnet = "${local.landingzone_prefix}-core-infra-res-subnet-${local.environment}-01"    
    # add more subnets here
  }
 */
 

}