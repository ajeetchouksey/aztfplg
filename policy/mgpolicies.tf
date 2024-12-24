
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
    scope                = each.value.scope

    # The ID of the policy definition to be assigned
    policy_definition_id = each.value.policy_definition_id

    # The location where the policy assignment will be created
    location             = each.value.location

    # The parameters for the policy assignment, encoded as a JSON string
    parameters           = each.value.parameters
      # Add filter conditions
  metadata = jsonencode({
    assignedBy = "Terraform"
    filter     = "atScope()"
  })
}
