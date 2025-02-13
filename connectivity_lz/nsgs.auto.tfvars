security_rules = [
    {
        name               = "nsg1"
        location           = "West Europe"
        resource_group_id  = "0"
        security_rules = [
            {
            name                       = "AllowVnetInBound"
            priority                   = 100
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "*"
            source_port_range          = ""
            source_port_ranges         = [80]
            destination_port_range     = "*"
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "VirtualNetwork"
            }
        ]
    }
    # add more NSG rules here
]