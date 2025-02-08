output "vnet_names" {
    value = [for vnet in module.vnets : vnet.name]
}


output "resource_group_names" {
    value = [for rg in module.azurerm_resource_group : rg.name]
}
