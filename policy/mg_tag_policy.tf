provider "azurerm" {
    features {}
}

resource "azurerm_management_group" "root" {
    name = "ajch_mgt_grp_01"
}

module "avm-ptn-policyassignment" {
    source  = "Azure/avm-ptn-policyassignment/azurerm"
    location = "westeurope"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/726aca4c-86e9-4b04-b0c5-073027359532"
    scope = azurerm_management_group.root.id
    display_name = "Add a tag to resource groups"
    parameters = {
        project = "TF Playgound"
    }
}