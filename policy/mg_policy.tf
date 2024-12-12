provider "azurerm" {
    features {}
}

module "management_group" {
    source  = "Azure/avm/azurerm"
    version = "2.0.0"

    root_parent_id = "f349b7a1-b209-4595-b331-63e27b9a4446" # Replace with your root parent ID
    root_id        = "ajch_mgt_grp_01"
    root_name      = "ajch_mgt_grp_01"
}

resource "azurerm_policy_definition" "tag_policy" {
    name                 = "tagging-policy"
    policy_type          = "Custom"
    mode                 = "All"
    display_name         = "Require a tag on resources"
    management_group_id  = module.management_group.root_management_group_id

    policy_rule = <<POLICY_RULE
    {
        "if": {
            "not": {
                "field": "[concat('tags[', parameters('tagName'), ']')]",
                "exists": "true"
            }
        },
        "then": {
            "effect": "enforce"
        }
    }
    POLICY_RULE

    parameters = <<PARAMETERS
    {
        "tagName": {
            "type": "String",
            "metadata": {
                "description": "Name of the tag, such as 'environment'",
                "displayName": "Project"
            }
        }
    }
    PARAMETERS
    }

resource "azurerm_policy_assignment" "tag_policy_assignment" {
    name                 = "tagging-policy-assignment"
    policy_definition_id = azurerm_policy_definition.tag_policy.id
    management_group_id  = module.management_group.root_management_group_id
    display_name         = "Enforce tagging policy"

    parameters = <<PARAMETERS
    {
        "tagName": {
            "value": "TF Playground"
        }
    }
    PARAMETERS
}
