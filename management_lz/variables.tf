variable "resource_groups" {
    description = "List of resource groups to be created"
    type = list(object({        
        id = string
        purpose = string
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
        id                 = string
        location            = string
        resource_group_index = number
        sku                 = string
        identity            = string
        retention_in_days                                  = number
        log_analytics_workspace_internet_ingestion_enabled = bool
        log_analytics_workspace_internet_query_enabled     = bool
    }))
}


variable "subscription_id" {
    description = "The subscription ID to be used"
    type        = string
  
}

variable "tenant_id" {
    description = "The tenant ID to be used"
    type        = string
  
}














































