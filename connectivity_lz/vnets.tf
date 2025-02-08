data "azurerm_log_analytics_workspace" "lwa" {
    name                = local.log_analytics_workspaces_name
    resource_group_name = local.log_analytics_workspaces_rg
}

module "vnets" {
    source  = "git::https://github.com/Azure/terraform-azurerm-avm-res-network-virtualnetwork.git?ref=0b98468937a391b625d32098bc558d3e7c8ef54e"

    for_each = { for idx, vnet in local.vnets : idx => vnet }
    name                = each.value.name
    resource_group_name = each.value.resource_group_name
    location            = each.value.location
    address_space       = each.value.address_space
    tags                = local.tags 

    /* Following properties are not mandatory, so they are commented out. Choose if you want to use them */

    // dns_servers = each.value.dns_servers
    // ddos_protection_plan = each.value.ddos_protection_plan.id
    // bgp_community = each.value.bgp_community
    // dhcpOptions = each.value.dhcp_options
    //enable_vm_protection = each.value.enable_vm_protection
    diagnostic_settings = {
        settings = {
            workspace_resource_id  = data.azurerm_log_analytics_workspace.lwa.id

             /* Following properties are not mandatory and will have default values, so they are commented out. Choose if you want to use them */
            // name                          = local.diagnostic_settings_name              
            // log_groups                    = ["allLogs"] // lookup(each.value, "log_groups", ["allLogs"])
            // metric_categories             = ["AllMetrics"] // lookup(each.value, "metric_categories", ["AllMetrics"])
            // log_analytics_destination_type = "Dedicated" // lookup(each.value, "log_analytics_destination_type", "Dedicated")
        }
    }
}
