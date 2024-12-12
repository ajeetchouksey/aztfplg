provider "azurerm" {
    features {}
}

module "management_group" {
 
   source  = "Azure/avm-ptn-policyassignment/azurerm"
   version = "0.1.0"

   location = "West Europe" # Add the required location attribute
   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/d157c373-a6c4-483d-aaad-570756956268"
   scope = "" # Add the required scope attribute
}
resource "azurerm_policy_assignment" "tag_policy_assignment" {
    name                 = "tag-policy-assignment"
    scope                = module.management_group.management_group_id
    policy_definition_id = module.management_group.policy_definition_id
    location             = module.management_group.location
    display_name         = "Enforce Tag Policy"
    description          = "This policy enforces the use of the 'project' tag with the value 'TF Playground'."
    parameters = jsonencode({
        tagName = {
            value = "project"
        }
        tagValue = {
            value = "TF Playground"
        }
    })
}