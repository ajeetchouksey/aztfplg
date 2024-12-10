variable "resource_groups" {
    description = "List of resource groups to be created"
    type = list(object({        
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

variable "log_analytics_workspaces" {
    description = "List of Log Analytics workspaces to be created"
    type = list(object({
        location            = string
        resource_group_id = number
        sku                 = string
    }))
}

















































