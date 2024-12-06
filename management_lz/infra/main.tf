
# Create a resource group for the core infrastructure
module "azurerm_resource_group" {
    source  = "Azure/avm-res-resources-resourcegroup/azurerm"
    version = "0.1.0"
    name = local.core_resource_group_name
    location            = local.location
}