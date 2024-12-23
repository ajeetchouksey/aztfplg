variable "mg_policies" {
    description = "Management group policies"
    type = map(object({
        scope                = string
        policy_definition_id = string
        location             = string
        parameters           = map(object({
            value = string
        }))
    }))
}
