data "azurerm_log_analytics_workspace" "nsglwa" {
    name                = local.log_analytics_workspaces_name
    resource_group_name = local.log_analytics_workspaces_rg
}

module "nsgs" {

    source =  "git::https://github.com/Azure/terraform-azurerm-avm-res-network-networksecuritygroup.git?ref=83e1e8f5ad945c5225e960ab8ff0989295ee2784"
    for_each            = { for nsg in local.nsgs : nsg.name => nsg }
    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name

    security_rules = {
        for security_rule in each.value.security_rules : security_rule.name => {
            name                        = security_rule.name
            priority                    = security_rule.priority
            direction                   = security_rule.direction
            access                      = security_rule.access
            protocol                    = security_rule.protocol
            source_address_prefix       = security_rule.source_address_prefix
            destination_address_prefix  = security_rule.destination_address_prefix
            destination_port_range      = security_rule.destination_port_range
        }
    }

}