variable "resource_groups" {
    description = "List of resource groups to be created"
    type = list(object({
        name     = string
        location = string
    }))
    default = [
        {
            name     = "coreinfra-rg"
            location = "West Europe"
        }
    ]
}


variable "location" {
    description = "The location where the resources will be created"
    type        = string
    default     = "West Europe"
}