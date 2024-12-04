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
