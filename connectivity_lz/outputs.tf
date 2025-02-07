output "vnet_names" {
    value = [for vnet in module.vnets : vnet.name]
}

output "vnet_locations" {
    value = [for vnet in module.vnets : vnet.location]
}


output "resource_group_names" {
    value = [for rg in module.azurerm_resource_group : rg.name]
}
