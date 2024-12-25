data "azurerm_management_group" "mg" {
    display_name = "ajch_mgt_grp_01"
}

# This Terraform configuration assigns Azure Policies at the management group level.
# It uses a module to create policy assignments based on the provided variables.
# The policies are defined in the mgpolicies.auto.tfvars file and include details
# such as the scope, policy definition ID, location, and parameters.
module "policy_assignment" {
    source  = "Azure/avm-ptn-policyassignment/azurerm"
    version = "0.2.0"

    # Iterate over each policy in the mg_policies variable
    for_each = { for policy in var.mg_policies : policy.policy_definition_id => policy }

    # The scope at which the policy will be assigned
    scope = data.azurerm_management_group.mg.id

    # The ID of the policy definition to be assigned
    policy_definition_id = each.value.policy_definition_id

    # The location where the policy assignment will be created
    location             = each.value.location

    # The parameters for the policy assignment, encoded as a JSON string
    parameters           = each.value.parameters


}
resource "azurerm_policy_assignment" "example" {
    for_each             = { for policy in var.mg_policies : policy.policy_definition_id => policy }
    name                 = each.value.name
    scope                = data.azurerm_management_group.mg.id
    policy_definition_id = each.value.policy_definition_id
    location             = each.value.location
    parameters           = each.value.parameters

    # Adding the filter to the policy assignment
    filter {
        policy_definition_id = each.value.policy_definition_id
    }
}