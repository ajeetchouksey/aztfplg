

# Create VNETs using the AVM module
module "azurerm_virtual_network" {
    source  = "Azure/avm-res-network-virtualnetwork/azurerm"
    version = "0.7.1"
    for_each = { for idx, vnet in var.vnet_configs : idx => vnet }

    name     = "${local.landingzone_prefix}-core-infra-vnet-${local.environment}-${each.value.vnet_id}"
    address_space       = each.value.address_space
    resource_group_name = contains(module.azurerm_resource_group[each.value.resource_group_index].name, "c-")    
    location            =contains(module.azurerm_resource_group[each.value.resource_group_index].location, "c-")    
    tags                = local.tags
    depends_on = [ module.azurerm_resource_group ]
}