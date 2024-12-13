# Call the naming module
module "naming" {
    source                 = "Azure/naming/azurerm"
    version                = "0.3.0"
    for_each = { for idx, rg in var.resource_groups : idx => rg }

    # Pass necessary variables to the naming module
    prefix = each.value.prefix
    suffix = each.value.suffix
}

# Create resource groups for the core infrastructure
module "azurerm_resource_group" {
    source  = "Azure/avm-res-resources-resourcegroup/azurerm"
    version = "0.1.0"
    for_each = { for idx, rg in var.resource_groups : idx => rg }

    name     = module.naming[each.key].name
    location = each.value.location
    tags     = local.tags
}
