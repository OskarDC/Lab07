terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.23.0"
    }
    github = {
      source = "integrations/github"
      version = "6.6.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "65acd3c7-2b62-4bb3-844f-bf8edde2f5cd"
  resource_provider_registrations = "none"
  features {}
}