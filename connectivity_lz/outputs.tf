output "vnet_names" {
    value = [for vnet in module.vnets : vnet.name]
}

output "vnet_locations" {
    value = [for vnet in module.vnets : vnet.location]
}

output "vnet_address_spaces" {
    value = [for vnet in module.vnets : vnet.address_space]
}
output "resource_group_names" {
    value = [for rg in module.azurerm_resource_group : rg.name]
}

output "resource_group_locations" {
    value = [for rg in module.azurerm_resource_group : rg.location]
}