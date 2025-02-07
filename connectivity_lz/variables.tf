# This file defines the variables used in the management landing zone configuration.
# 
# Variables:
# - landingzone_prefix: Prefix for the landing zone (default: "c").
# - resource_name_prefix: Prefix for the resource names (default: "tf").
# - location_short: Short name for the location (default: "we").
# - resource_groups: List of resource groups to be created, each with an id, purpose, and location.
# - location: The location where the resources will be created (default: "West Europe").
# - environment: The environment to be created.
# - log_analytics_workspaces: List of Log Analytics workspaces to be created, each with various properties such as id, location, resource_group_id, sku, identity, retention_in_days, and internet ingestion/query settings.
# - subscription_id: The subscription ID to be used.
# - tenant_id: The tenant ID to be used.

variable "subscription_id" {
    description = "The subscription ID to be used"
    type        = string
  
}

variable "tenant_id" {
    description = "The tenant ID to be used"
    type        = string
  
}
variable "landingzone_prefix" {
    description = "Prefix for the landing zone"
    type        = string
    default     = "c"
}

variable "resource_name_prefix" {
    description = "Prefix for the resource names"
    type        = string
    default     = "tf"
}

variable "location_short" {
    description = "Short name for the location"
    type        = string
    default     = "we"
}

variable "resource_groups" {
    description = "List of resource groups to be created"
    type = list(object({        
        id = string
        purpose = string
        location = string 
    }))
  
}


variable "location" {
    description = "The location where the resources will be created"
    type        = string
    default     = "West Europe"
}

variable "environment" {
    description = "The environment to be created"
    type        = string  
}


variable "vnets" {
    description = "List of virtual networks to be created"
    type = list(object({        
        id = string
        location = string
        resource_group_id = number
        address_space = list(string)
        dns_servers = object({
            servers = list(string)
        }) 
        
        ddos_protection_plan = object({
            id = string
            location = string
            enable = bool
        })
        bgp_community = string
        dhcp_options = string
        enable_vm_protection = bool
        encryption = object({
            key_vault_id = string
            key_name = string
            key_version = string
        })
        
    }))
  
}














































