variable "resource_groups" {
    description = "List of resource groups to be created"
    type = list(object({        
        id = string
        location = string 
    }))
  
}
variable "vnet_configs" {
    description = "List of VNETs to be created"
    type = list(object({        
        vnet_id = string
        address_space = list(string)       
        resource_group_index = string
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

















































