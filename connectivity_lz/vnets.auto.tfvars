vnets = [
    {
        id = "01"
        location = "West Europe"
        resource_group_id = 0
        address_space = ["10.0.0.0/24"]
        dns_servers = []
        ddos_protection_plan = {
            id = ""
            location = ""
            enable = false
        }
        bgp_community = "12076:20001"
        dhcp_options = ""
        enable_vm_protection = false
        encryption = {
            key_vault_id = ""
            key_name = ""
            key_version = ""
        }
       
    }
    # Add more virtual networks as needed
]

log_analytics_workspaces = {
  name = "m-ci-p-la-01"
  resource_group_name = "m-ci-p-rg-01"
}