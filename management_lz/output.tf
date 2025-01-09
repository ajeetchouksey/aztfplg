output "resource_groups" {
    description = "List of resource groups with their names"
    value = {
        for idx, rg in module.azurerm_resource_group :
        idx => {
            name     = rg.outputs.name         
        }
    }
}

output "resource_group_locations" {
    description = "List of resource groups with their locations"
    value = {
        for idx, rg in module.azurerm_resource_group :
        idx => {
            location = rg.outputs.location
        }
    }
}