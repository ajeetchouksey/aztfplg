resource "azurerm_management_group" "root" {
    name = "ajch_mgt_grp_01"
}

module "avm-ptn-policyassignment" {
    source                = "Azure/avm-ptn-policyassignment/azurerm"
    location              = "westeurope"
    policy_definition_id  = "/providers/Microsoft.Authorization/policyDefinitions/726aca4c-86e9-4b04-b0c5-073027359532"
    scope                 = azurerm_management_group.root.id
    display_name          = "Add a tag to resource groups"
    
    
    parameters = {
        project = {
            value = "TF Playgound"
        }
    }

    role_assignments = {
        ra = {
            role_definition_id_or_name = "Contributor"
            principal_id         = "7d74bbca-838b-4105-86d3-05a08c1c5490"
            // Do not set principal_type here
        }
    }
}
