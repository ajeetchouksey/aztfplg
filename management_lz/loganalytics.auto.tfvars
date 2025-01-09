log_analytics_workspaces = [
    {
        id = "01"
        location            = "westeurope"
        resource_group_index = 0
        sku = "PerGB2018"
        retention_in_days                                  = 30
        identity                                           = "SystemAssigned"
        log_analytics_workspace_internet_ingestion_enabled = true
        log_analytics_workspace_internet_query_enabled     = true
    }
    # Add more workspaces as needed
]
