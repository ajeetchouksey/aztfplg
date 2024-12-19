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


variable "container_apps_environment" {
  type = list(object({
    container_app_environment_name = string
    resource_group_name            = string
    enable_telemetry  = optional(bool, false)
    log_analytics_workspace_customer_id = optional(string)
    log_analytics_workspace_destination = optional(string)
    log_analytics_workspace_primary_shared_key = optional(string)
    zone_redundancy_enabled = optional(bool, false)
    //custom_domain_dns_suffix = optional(string)
  }))
}

variable "container_apps" {
    type = list(object({
        name = string
        //resource_group_name = string
       // container_app_environment_resource_id = string
        revision_mode = string
        enable_telemetry  = optional(bool, false)
        registries = list(object({
            identity             = optional(string)
            password_secret_name = optional(string)
            server               = string
            username             = optional(string)
        }))
        template = object({
            max_replicas    = optional(number)
            min_replicas    = optional(number)
            revision_suffix = optional(string)
            azure_queue_scale_rules = optional(list(object({
                name         = string
                queue_length = number
                queue_name   = string
                authentication = list(object({
                    secret_name       = string
                    trigger_parameter = string
                }))
            })))
            containers = list(object({
                args    = optional(list(string))
                command = optional(list(string))
                cpu     = number
                image   = string
                memory  = string
                name    = string
                env = optional(list(object({
                    name        = string
                    secret_name = optional(string)
                    value       = optional(string)
                })))
                liveness_probes = optional(list(object({
                    failure_count_threshold = optional(number)
                    host                    = optional(string)
                    initial_delay           = optional(number)
                    interval_seconds        = optional(number)
                    path                    = optional(string)
                    port                    = number
                    timeout                 = optional(number)
                    transport               = string
                    header = optional(list(object({
                        name  = string
                        value = string
                    })))
                })))
                readiness_probes = optional(list(object({
                    failure_count_threshold = optional(number)
                    host                    = optional(string)
                    interval_seconds        = optional(number)
                    path                    = optional(string)
                    port                    = number
                    success_count_threshold = optional(number)
                    timeout                 = optional(number)
                    transport               = string
                    header = optional(list(object({
                        name  = string
                        value = string
                    })))
                })))
                startup_probe = optional(list(object({
                    failure_count_threshold = optional(number)
                    host                    = optional(string)
                    interval_seconds        = optional(number)
                    path                    = optional(string)
                    port                    = number
                    timeout                 = optional(number)
                    transport               = string
                    header = optional(list(object({
                        name  = string
                        value = string
                    })))
                })))
                volume_mounts = optional(list(object({
                    name = string
                    path = string
                })))
            }))
            custom_scale_rules = optional(list(object({
                custom_rule_type = string
                metadata         = map(string)
                name             = string
                authentication = optional(list(object({
                    secret_name       = string
                    trigger_parameter = string
                })))
            })))
            http_scale_rules = optional(list(object({
                concurrent_requests = string
                name                = string
                authentication = optional(list(object({
                    secret_name       = string
                    trigger_parameter = optional(string)
                })))
            })))
            init_containers = optional(list(object({
                args    = optional(list(string))
                command = optional(list(string))
                cpu     = optional(number)
                image   = string
                memory  = optional(string)
                name    = string
                env = optional(list(object({
                    name        = string
                    secret_name = optional(string)
                    value       = optional(string)
                })))
                volume_mounts = optional(list(object({
                    name = string
                    path = string
                })))
            })))
            tcp_scale_rules = optional(list(object({
                concurrent_requests = string
                name                = string
                authentication = optional(list(object({
                    secret_name       = string
                    trigger_parameter = optional(string)
                })))
            })))
            volumes = optional(list(object({
                name         = string
                storage_name = optional(string)
                storage_type = optional(string)
            })))
        })



    }))      
}

