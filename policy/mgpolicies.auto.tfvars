

mg_policies = {
    mandatory = {
        scope                = "/providers/Microsoft.Management/managementGroups/ajch_mgt_grp_01"
        policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4f9dc7db-30c1-420c-b61a-e1d640128d26"
        location             = "westeurope"
        parameters = {
            project = {
                value = "TF Playground"
            }
        }
    }
  # add more policies here
}


