security_rules = [
    {
        name               = "nsg1"
        location           = "West Europe"
        resource_group_id  = "0"
        security_rules = [
            {
                name                       = "https-inbound"
                priority                   = 100
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range         = ""
                source_port_ranges          = [443] 
                destination_port_range     = "*"
                source_address_prefix      = "*"
                destination_address_prefix = "*"
            }
        ]
    }
    # add more NSG rules here
]