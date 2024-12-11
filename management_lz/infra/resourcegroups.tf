# Create resource groups for the core infrastructure
module "azurerm_resource_group" {
    source  = "Azure/avm-res-resources-resourcegroup/azurerm"
    version = "0.1.0"
    for_each = { for idx, rg in local.resource_groups_name : idx => rg }

    name     = each.value.name
    location = each.value.location
}
