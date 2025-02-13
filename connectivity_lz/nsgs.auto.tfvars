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
            source_port_ranges         = ["*"]
            destination_port_range     = "*"
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "VirtualNetwork"
            },
            {
            name                       = "AllowAzureLoadBalancerInBound"
            priority                   = 200
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "*"
            source_port_range          = ""
            source_port_ranges         = ["*"]
            destination_port_range     = "*"
            source_address_prefix      = "AzureLoadBalancer"
            destination_address_prefix = "*"
            },
            {
            name                       = "DenyAllInBound"
            priority                   = 300
            direction                  = "Inbound"
            access                     = "Deny"
            protocol                   = "*"
            source_port_range          = ""
            source_port_ranges         = ["*"]
            destination_port_range     = "*"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
            },
            {
            name                       = "AllowVnetOutBound"
            priority                   = 100
            direction                  = "Outbound"
            access                     = "Allow"
            protocol                   = "*"
            source_port_range          = ""
            source_port_ranges         = ["*"]
            destination_port_range     = "*"
            source_address_prefix      = "VirtualNetwork"
            destination_address_prefix = "VirtualNetwork"
            },
            {
            name                       = "AllowInternetOutBound"
            priority                   = 200
            direction                  = "Outbound"
            access                     = "Allow"
            protocol                   = "*"
            source_port_range          = ""
            source_port_ranges         = ["*"]
            destination_port_range     = "*"
            source_address_prefix      = "*"
            destination_address_prefix = "Internet"
            },
            {
            name                       = "DenyAllOutBound"
            priority                   = 300
            direction                  = "Outbound"
            access                     = "Deny"
            protocol                   = "*"
            source_port_range          = ""
            source_port_ranges         = ["*"]
            destination_port_range     = "*"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
            }
        ]
    }
    # add more NSG rules here
]