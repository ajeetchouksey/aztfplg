module "vnets" {
    source  =  "git::https://github.com/Azure/terraform-azurerm-avm-res-network-virtualnetwork.git?ref=0b98468937a391b625d32098bc558d3e7c8ef54e"

    for_each = { for vnet in local.vnets : vnet.id => vnet }

        resource_group_name = each.value.resource_group_name
        location            = each.value.location
        address_space       = each.value.address_space
        tags                = local.tags 
        dns_servers = each.value.dns_servers
        ddos_protection_plan = each.value.ddos_protection_plan
        bgp_community = each.value.bgp_community
        //dhcpOptions = each.value.dhcp_options
        enable_vm_protection = each.value.enableVmProtection
        encryption = each.value.encryption
        
}