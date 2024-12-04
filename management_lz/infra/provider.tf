terraform {
    backend "local" {
        path = "terraform.tfstate"
    }

    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=3.81.0"
        }
        random = {
            source  = "hashicorp/random"
            version = "= 3.5.1"
        }
    }
}
provider "azurerm" {
    features {}
    use_msi = true
    client_id = "812086d5-b17f-4983-9047-97053307649d"
}