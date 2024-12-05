terraform {
    backend "azurerm" {
        use_msi   = true
        client_id = "812086d5-b17f-4983-9047-97053307649d"
    }

    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=3.81.0"
        }
        random = {
            source  = "hashicorp/random"
            version = "=3.5.1"
        }
    }
}

provider "azurerm" {
    features {}
    client_id                  = "812086d5-b17f-4983-9047-97053307649d"
    use_msi                    = true
    subscription_id            = "5e46e350-0c43-434d-8ba5-8888b9017003"
    tenant_id                  = "f349b7a1-b209-4595-b331-63e27b9a4446"
    skip_provider_registration = true
}
