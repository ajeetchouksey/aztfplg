
# Create a resource group for the core infrastructure
module "resource_group" {
    source              = "Azure/resource-group/azurerm"
    version             = "2.0.0"
    resource_group_name = local.core_resource_group_name
    location            = local.location
}