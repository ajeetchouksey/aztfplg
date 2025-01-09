output "resource_groups" {
    description = "List of resource groups with their names and locations"
    value = {
        for idx, rg in module.azurerm_resource_group :
        idx => {
            name     = rg.outputs.name
            location = rg.outputs.location
        }
    }
}