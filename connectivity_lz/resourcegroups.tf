# Create resource groups for the core infrastructure
module "azurerm_resource_group" {
    source  = "Azure/avm-res-resources-resourcegroup/azurerm"
    version = "0.1.0"
    for_each = { for idx, rg in var.resource_groups : idx => rg }

    name     = module.naming.resource_group
    location = each.value.location
    tags = local.tags
}
