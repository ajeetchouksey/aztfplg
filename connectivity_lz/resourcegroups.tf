# Create resource groups for the core infrastructure
module "azurerm_resource_group" {
    # Source of the module to create resource groups
    source  = "Azure/avm-res-resources-resourcegroup/azurerm"
    
    # Version of the module to use
    version = "0.1.0"
    
    # Iterate over each resource group defined in the locals
    for_each = { for idx, rg in local.resource_groups_name : idx => rg }

        # Define the name of the resource group
        name     = each.value.name
        
        # Set the location for the resource group
        location = each.value.location
        
        # Set the tags for the resource group
        tags = local.tags
}
