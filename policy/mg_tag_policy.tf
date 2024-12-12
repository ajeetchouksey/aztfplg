provider "azurerm" {
    features {}
}

resource "azurerm_management_group" "root" {
    name = "ajch_mgt_grp_01"
}

module "assign_policy_at_management_group" {
    source  = "Azure/terraform-azurerm-avm-ptn-policyassignment/azurerm"
    version = "0.1.0"
    
    policy_definitions = {
        "tag-policy" = {
            display_name = "Tag Policy"
            description  = "This policy ensures that all indexed resources are tagged with a value for a specific tag."
            policy_rule  = <<POLICY_RULE
            {
                "if": {
                    "allOf": [
                        {
                            "field": "tags['project']",
                            "exists": "false"
                        }
                    ]
                },
                "then": {
                    "effect": "deny"
                }
            }
            POLICY_RULE
        }
    }
}