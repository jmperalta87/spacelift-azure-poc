terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

module "resource_group" {
  source  = "us.spacelift.io/jmperalta87/spacelift-azure-poc/default"
  version = "0.1.0"

  name     = var.resource_group_name
  location = var.location
  owner    = var.application_owner
  app_name = var.application_name
}