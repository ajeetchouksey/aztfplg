
resource "azurerm_resource_group" "example" {
    name     = local.core_resource_group_name
    location = local.location
}