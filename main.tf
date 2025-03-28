terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.23.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.2.0"
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

provider "azuread" {
  tenant_id = "0dc7bb82-e2df-40a1-aa18-6af992e9c4aa"
}

provider "github" {
  token = "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"
}

data "azuread_client_config" "current" {}
data "azurerm_client_config" "current" {}
