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

variable "subscription_id" {
    description = "The subscription ID to be used"
    type        = string
  
}

variable "tenant_id" {
    description = "The tenant ID to be used"
    type        = string
  
}

