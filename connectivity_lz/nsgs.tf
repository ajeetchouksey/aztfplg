data "azurerm_log_analytics_workspace" "lwa" {
    name                = local.log_analytics_workspaces_name
    resource_group_name = local.log_analytics_workspaces_rg
}

module "nsgs" {

    source =  "git::https://github.com/Azure/terraform-azurerm-avm-res-network-networksecuritygroup.git?ref=83e1e8f5ad945c5225e960ab8ff0989295ee2784"
    for_each            = { for nsg in local.nsgs : nsg.name => nsg }
    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name

    dynamic "security_rule" {
        for_each = each.value.security_rules
        content {
            name                        = security_rule.value.name
            priority                    = security_rule.value.priority
            direction                   = security_rule.value.direction
            access                      = security_rule.value.access
            protocol                    = security_rule.value.protocol
            source_address_prefix       = security_rule.value.source_address_prefix
            destination_address_prefix  = security_rule.value.destination_address_prefix
            destination_port_range      = security_rule.value.destination_port_range
        }
    }
}