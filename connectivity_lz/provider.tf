terraform {
    backend "azurerm" {}

    required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "< 4.0.0, < 5.0.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0, < 4.0.0"
    }
    }
}

provider "azurerm" {
    features {}
    subscription_id            = "5e46e350-0c43-434d-8ba5-8888b9017003"
    tenant_id                  = "f349b7a1-b209-4595-b331-63e27b9a4446"
    skip_provider_registration = true
}
