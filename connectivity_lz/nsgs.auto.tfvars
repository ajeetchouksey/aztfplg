security_rules = [
    {
        name               = "nsg1"
        location           = "West Europe"
        resource_group_id  = "0"
        security_rules = [
            {
                name                        = "AllowHTTP"
                access                     = "Allow"
                destination_address_prefix = "*"
                destination_port_ranges    = ["80", "443"]
                direction                  = "Inbound"
                priority                   = 200
                protocol                   = "Tcp"
                source_address_prefix      = "*"
                source_port_range          = "*"
               
            }
        ]
    }
    # add more NSG rules here
]