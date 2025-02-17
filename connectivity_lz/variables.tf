variable "subscription_id" {
    description = "The subscription ID to be used"
    type        = string
    validation {
        condition     = length(var.subscription_id) > 0
        error_message = "The subscription ID must not be empty."
    }
}

variable "tenant_id" {
    description = "The tenant ID to be used"
    type        = string
    validation {
        condition     = length(var.tenant_id) > 0
        error_message = "The tenant ID must not be empty."
    }
}

variable "landingzone_prefix" {
    description = "Prefix for the landing zone"
    type        = string
    default     = "c"
    validation {
        condition     = length(var.landingzone_prefix) > 0
        error_message = "The landing zone prefix must not be empty."
    }
}

variable "resource_name_prefix" {
    description = "Prefix for the resource names"
    type        = string
    default     = "tf"
    validation {
        condition     = length(var.resource_name_prefix) > 0
        error_message = "The resource name prefix must not be empty."
    }
}

variable "location_short" {
    description = "Short name for the location"
    type        = string
    default     = "we"
    validation {
        condition     = length(var.location_short) > 0
        error_message = "The location short name must not be empty."
    }
}

variable "resource_groups" {
    description = "List of resource groups to be created"
    type = list(object({        
        id = string
        purpose = string
        location = string 
    }))
    validation {
        condition     = length(var.resource_groups) > 0
        error_message = "The resource groups list must not be empty."
    }
}

variable "location" {
    description = "The location where the resources will be created"
    type        = string
    default     = "West Europe"
    validation {
        condition     = length(var.location) > 0
        error_message = "The location must not be empty."
    }
}

variable "environment" {
    description = "The environment to be created"
    type        = string
    validation {
        condition     = length(var.environment) > 0
        error_message = "The environment must not be empty."
    }
}

variable "vnets" {
    description = "List of virtual networks to be created"
    type = list(object({        
        id = string
        location = string
        resource_group_id = number
        address_space = list(string)
        dns_servers = list(string)
        
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
    validation {
        condition     = length(var.vnets) > 0
        error_message = "The virtual networks list must not be empty."
    }
}

/* variable "log_analytics_workspace" {
    description = "The name of the Log Analytics workspace"
    type        = string
    validation {
        condition     = length(var.log_analytics_workspace) > 0
        error_message = "The Log Analytics workspace name must not be empty."
    }
}    */



variable "security_rules"{
  type = list(object({
    name                = string
    location            = string
    resource_group_id  = string
    nsgs = list(object({
      name                        = string
      access                      = string
      direction                   = string
      priority                    = number
      protocol                    = string
      source_address_prefix       = string
      destination_address_prefix  = string
      destination_port_range      = string
      source_port_range          = string
      source_port_ranges          = list(string)
    }))
  }))
}

