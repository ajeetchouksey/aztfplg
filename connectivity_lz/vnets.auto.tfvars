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
        bgp_community = ""
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