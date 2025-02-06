# This file defines the resource groups to be created in the management landing zone.
# Each resource group is defined with various properties such as id, purpose, and location.

resource_groups = [
    {
        # Unique identifier for the resource group
        id = "01"
        
        # Purpose of the resource group
        purpose = "core"
        
        # Location where the resource group will be created
        location = "westeurope"
    }

    # Add more resource groups as needed
]