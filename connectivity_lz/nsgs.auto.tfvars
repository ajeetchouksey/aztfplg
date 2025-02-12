security_rules = {
    "nsg1" = {
        //name = "nsg1"
       // resource_group_id = "0"
        
        "rule1" = {
            name = "AllowSSH"
            access                      = "Allow"
            direction                   = "Inbound"
            name                        = "AllowSSH"
            priority                    = 100
            protocol                    = "Tcp"
            source_address_prefix       = "*"
            destination_address_prefix  = "*"
            destination_port_range      = "22"
        }
    }
    # add more NSG rules here
}