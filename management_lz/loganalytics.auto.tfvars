log_analytics_workspaces = [
    {
        id = "01"
        location            = "westeurope"
        resource_group_id = 0
        sku = "PerGB2018"
        retention_in_days                                  = 30
        identity                                           = "SystemAssigned"
        log_analytics_workspace_internet_ingestion_enabled = true
        log_analytics_workspace_internet_query_enabled     = true
    }
    # Add more workspaces as needed
]
/* log_analytics_workspace_identity = {
    identity_ids = ["43d09976-1ab4-462c-8d2d-c480d070cfa6"]
    type         = "SystemAssigned"
} */