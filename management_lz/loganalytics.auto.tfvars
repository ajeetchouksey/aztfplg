# This file defines the Log Analytics workspaces to be created in the management landing zone.
# Each workspace is defined with various properties such as id, location, resource group ID, SKU, retention period, identity, and internet ingestion/query settings.

log_analytics_workspaces = [
    {
        # Unique identifier for the Log Analytics workspace
        id = "01"
        
        # Location where the Log Analytics workspace will be created
        location = "westeurope"
        
        # Index of the resource group in which the Log Analytics workspace will be created
        resource_group_id = 0
        
        # SKU (pricing tier) of the Log Analytics workspace
        sku = "PerGB2018"
        
        # Retention period (in days) for the Log Analytics workspace
        retention_in_days = 30
        
        # Identity configuration for the Log Analytics workspace
        identity = "SystemAssigned"
        
        # Enable or disable internet ingestion for the Log Analytics workspace
        log_analytics_workspace_internet_ingestion_enabled = true
        
        # Enable or disable internet query for the Log Analytics workspace
        log_analytics_workspace_internet_query_enabled = true
    }
    # Add more workspaces as needed
]
