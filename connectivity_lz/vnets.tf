
data "azurerm_log_analytics_workspace" "lwa" {
   
    name                = var.log_analytics_workspaces.name
    resource_group_name = var.log_analytics_workspaces.resource_group_name
}
module "vnets" {
    source  =  "git::https://github.com/Azure/terraform-azurerm-avm-res-network-virtualnetwork.git?ref=0b98468937a391b625d32098bc558d3e7c8ef54e"

    for_each = { for idx, vnet in local.vnets : idx => vnet }
        name                = each.value.name
        resource_group_name = each.value.resource_group_name
        location            = each.value.location
        address_space       = each.value.address_space
        tags                = local.tags 
       // dns_servers = each.value.dns_servers
      //  ddos_protection_plan = each.value.ddos_protection_plan.id
       // bgp_community = each.value.bgp_community
        //dhcpOptions = each.value.dhcp_options
        enable_vm_protection = each.value.enable_vm_protection
            diagnostic_settings = [{
                name                          = each.value.name
                resource_group_name           = each.value.resource_group_name
                log_analytics_workspace_id    = data.azurerm_log_analytics_workspace.lwa.id
               // log_groups                    = ["allLogs"]//lookup(each.value, "log_groups", ["allLogs"])
                //metric_categories             = ["AllMetrics"]//lookup(each.value, "metric_categories", ["AllMetrics"])
               // log_analytics_destination_type = "Dedicated"//lookup(each.value, "log_analytics_destination_type", "Dedicated")
            }]

}