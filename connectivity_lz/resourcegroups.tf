# Create resource groups for the core infrastructure
module "azurerm_resource_group" {
    source  = "Azure/avm-res-resources-resourcegroup/azurerm"
    version = "0.1.0"
    for_each = { for idx, rg in var.resource_groups : idx => rg }

    name     = "${local.landingzone_prefix}-core-infra-rg-${local.environment}-${each.value.id}"
    location = each.value.location
    tags = local.tags
}
