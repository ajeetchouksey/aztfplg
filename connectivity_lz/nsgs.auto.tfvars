security_rules = [
    {
        name               = "nsg1"
        location           = "West Europe"
        resource_group_id  = "0"
        security_rules = [
            {
                name                        = "AllowSSH"
                access                      = "Allow"
                direction                   = "Inbound"
                priority                    = 100
                protocol                    = "Tcp"
                source_address_prefix       = "*"
                destination_address_prefix  = "*"
                source_port_ranges          = ["Any"]
                destination_port_range      = 22
            }
        ]
    }
    # add more NSG rules here
]