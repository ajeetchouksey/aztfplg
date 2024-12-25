data "azurerm_management_group" "mg" {
    display_name = "ajch_mgt_grp_01"
}

# This Terraform configuration assigns Azure Policies at the management group level.
# It uses a module to create policy assignments based on the provided variables.
# The policies are defined in the mgpolicies.auto.tfvars file and include details
# such as the scope, policy definition ID, location, and parameters.
module "assign_policy_at_management_group" {
    source = "git::https://github.com/Azure/terraform-azurerm-avm-ptn-policyassignment.git?ref=bfea8dad3c97f14ef415b580f3a430b9a74b5910"

    # Iterate over each policy in the mg_policies variable
    for_each = { for policy in var.mg_policies : policy.policy_definition_id => policy }

    # The scope at which the policy will be assigned
    scope =  "/providers/Microsoft.Management/managementGroups/ajch_mgt_grp_01"

    # The ID of the policy definition to be assigned
    policy_definition_id = each.value.policy_definition_id

    # The location where the policy assignment will be created
    location             = each.value.location

    # The parameters for the policy assignment, encoded as a JSON string
    parameters           = each.value.parameters


}
