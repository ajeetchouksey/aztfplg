# Create resource groups for the core infrastructure
module "azurerm_resource_group" {
    #source  = "Azure/avm-res-resources-resourcegroup/azurerm"
    source = "git::https://github.com/ajeetchouksey/terraform-azurerm-avm-res-resources-resourcegroup.git?ref=dddeccef94dc5bd011c97cd8c8a9cdb7921dde5c"
    #version = "0.1.0"
    for_each = { for idx, rg in var.resource_groups : idx => rg }

    name     = "${local.landingzone_prefix}-${each.value.purpose}-${local.environment}-rg-${each.value.id}"
    location = each.value.location
    tags = local.tags
}
