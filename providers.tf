terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100" # stable 3.x line; adjust if you need a specific version
    }
  }
}

provider "azurerm" {
  features {}
}