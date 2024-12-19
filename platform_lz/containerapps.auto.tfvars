container_apps = [
    {
        name                         = "my-container-app"
        revision_mode                = "Single"
        enable_telemetry             = false
        registries                   = []
        template = {
            max_replicas             = 1
            min_replicas             = 1
            revision_suffix          = "v1"
            azure_queue_scale_rules  = null
            containers = [
                {
                    args             = []
                    command          = []
                    cpu              = 2
                    image            = "my-container-image"
                    memory           = "4Gi"
                    name             = "my-container"
                    env              = []
                    liveness_probes  = []
                    readiness_probes = []
                    startup_probe    = []
                    volume_mounts    = []
                }
            ]
            custom_scale_rules       = []
            http_scale_rules = [
                {
                    concurrent_requests = "10"
                    name                = "http-scaler"
                    authentication      = null
                }
            ]
            init_containers          = []
            tcp_scale_rules          = []
            volumes                  = []
        }
    }
]
