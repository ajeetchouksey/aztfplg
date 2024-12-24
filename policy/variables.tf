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

variable "mg_policies" {
    description = "Management group policies"
    type = list(object({
        scope                = string
        policy_definition_id = string
        location             = string
        parameters           = map(object({
            value = string
        }))
    }))
}
