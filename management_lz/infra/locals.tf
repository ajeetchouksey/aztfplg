locals {
    location = "West Europe"
    landing_zone_name_prefix = "m"
    
    core_resource_group_name = "${local.landing_zone_name_prefix}-coreinfra-rg"

}
