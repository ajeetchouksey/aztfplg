provider "azurerm" {
    features {}
}

module "management_group" {
    source  = "Azure/avm/azurerm"
    version = "2.0.0"

    root_parent_id = "00000000-0000-0000-0000-000000000000" # Replace with your root parent ID
    root_id        = "example-mg"
    root_name      = "Example Management Group"
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
                "displayName": "Tag Name"
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
            "value": "environment"
        }
    }
    PARAMETERS
}
