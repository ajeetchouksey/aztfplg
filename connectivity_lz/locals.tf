locals {
  # Tags to be applied to resources
 
  tags = {
    environment = var.environment
    landingzone = "connectivity"
    project = "TF Playground"
    last_updated = formatdate("YYYY-MM-DD", timestamp())
  }

  # List of resource group names and locations
  resource_groups_name = [
    for rg in var.resource_groups : {
      # Construct the resource group name using the landing zone prefix, environment, and resource group ID
      name = "${var.landingzone_prefix}-ci-${var.environment}-rg-${rg.id}"
      location = rg.location
    }
  ]
          

  # List of virtual networks with their properties
  vnets = [
    for vnet in var.vnets : {
      # Construct the virtual network name using the landing zone prefix, environment, and virtual network ID
      name = "${var.landingzone_prefix}-ci-${var.environment}-vnet-${vnet.id}"
      location = vnet.location
      resource_group_name = element([for rg in local.resource_groups_name : rg.name], vnet.resource_group_id)
      address_space = vnet.address_space
      dns_servers = vnet.dns_servers
      ddos_protection_plan = vnet.ddos_protection_plan
      bgp_community = vnet.bgp_community
      dhcp_options = vnet.dhcp_options
      enable_vm_protection = vnet.enable_vm_protection
      encryption = vnet.encryption
     
      
    }
  ]       

log_analytics_workspaces_name = "m-ci-p-la-01"
log_analytics_workspaces_rg =  "m-ci-p-rg-01"

# List of network security groups with their properties
nsgs = [
  for nsg_key, nsg in var.security_rules : {
    name = nsg_key
    resource_group_name = element([for rg in local.resource_groups_name : rg.name], nsg.resource_group_id)
    location = element([for rg in local.resource_groups_name : rg.location], nsg.resource_group_id)
    security_rules = [
      for rule_key, rule in nsg : {
        name                        = rule.name
        access                      = rule.access
        direction                   = rule.direction
        priority                    = rule.priority
        protocol                    = rule.protocol
        source_address_prefix       = rule.source_address_prefix
        destination_address_prefix  = rule.destination_address_prefix
        destination_port_range      = rule.destination_port_range
      }
    ]
  }
]


}

