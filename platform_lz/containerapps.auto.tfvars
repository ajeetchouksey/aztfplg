container_apps = [
    {
        name                                    = "my-container-app"
        // resource_group_name                     = "my-resource-group"
        //container_app_environment_resource_id   = ""
        revision_mode                                = "Single"
        enable_telemetry                        = false
        registries = [
/*             {
               // identity             = "my-identity"
                password_secret_name = "my-password-secret"
                server               = "my-registry-server"
                username             = "my-username"
            } */
        ]
        template = {
            max_replicas    = 1
            min_replicas    = 1
            revision_suffix = "v1"
            azure_queue_scale_rules = null
            containers = [
                {
                    args    = []
                    command = []
                    cpu     = 2
                    image   = "my-container-image"
                    memory  = "4Gi"
                    name    = "my-container"
                    env = []
                    liveness_probes = []
                    readiness_probes = []
                    startup_probe = []
                    volume_mounts = []
                }
            ]
            custom_scale_rules = []
            http_scale_rules = [
                {
                    concurrent_requests = "10"
                    name                = "http-scaler"
                    authentication = null
                }
            ]
            init_containers = []
            tcp_scale_rules = []
            volumes = []
        }
    }
]
