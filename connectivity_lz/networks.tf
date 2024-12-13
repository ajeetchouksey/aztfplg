
data "azurerm_resource_group" "existing_rg" {
    for_each = { for rg in var.resource_groups : rg.id => rg }
    name     = "${local.landingzone_prefix}-core-infra-rg-${local.environment}-${each.value.id}"
}

# Create VNETs using the AVM module
module "azurerm_virtual_network" {
    source  = "Azure/avm-res-network-virtualnetwork/azurerm"
    version = "0.1.0"
    for_each = { for idx, vnet in var.vnet_configs : idx => vnet }

    name     = "${local.landingzone_prefix}-core-infra-vnet-${local.environment}-${each.value.id}"
    address_space       = each.value.address_space
    resource_group_name = data.azurerm_resource_group.existing_rg[each.value.resource_group_index].name
  
    tags                = local.tags
}