terraform {
    backend "azurerm" {}
    required_version = ">= 1.9.2"
    required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
     // version = "< 4.0.0, < 5.0.0"
     version =  ">= 2.0.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0, < 4.0.0"
    }
    }
}

provider "azurerm" {
    features {}
    subscription_id            = var.subscription_id 
    tenant_id                  = var.tenant_id 
    skip_provider_registration = true
}
