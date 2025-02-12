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
        for idx, rule in each.value.security_rules : idx => {
            name                        = rule.name
            access                      = rule.access
            direction                   = rule.direction
            priority                    = rule.priority
            protocol                    = rule.protocol
            source_address_prefix       = rule.source_address_prefix
            destination_address_prefix  = rule.destination_address_prefix
            destination_port_range      = rule.destination_port_range
            //source_port_ranges         = rule.source_port_ranges
        }
    }

}