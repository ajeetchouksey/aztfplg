# create tfvar values based on mg_polices variable defined in variables.tf

mg_policies = [
    {
        scope                = "/providers/Microsoft.Management/managementGroups/ajch_mgt_grp_01"
        policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/3c8b7e1a-2b7e-4b8a-9c8b-1e8b7e1a2b7e"
        location             = "westeurope"
        parameters = {
            project = {
                value = "TF playground"
            }
        }
    }
]

