resource_groups = [
    # resource group for the shared services
    {      
        id = "00"
        purpose = "shd"
        location = "westeurope"
    },    
    # resource group for the container apps both managed environments and the container apps
    {      
        id = "01"
        purpose = "ca"
        location = "westeurope"
    }

    # add more resource groups here
]