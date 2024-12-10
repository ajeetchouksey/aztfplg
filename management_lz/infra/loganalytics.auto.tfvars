log_analytics_workspaces = [
    {
        location            = "westeurope"
        resource_group_id = 1
    }
    # Add more workspaces as needed
]
log_analytics_workspace_identity = {
    identity_ids = ["43d09976-1ab4-462c-8d2d-c480d070cfa6"]
    type         = "SystemAssigned"
}