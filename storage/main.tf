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
}

# Reference the existing Resource Group (managed by Stack 1)
data "azurerm_resource_group" "rg" {
  name = "SpaceLift-PoC"
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "stspaceliftpoc"  # Must be globally unique, lowercase, no dashes, max 24 chars
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"  # Locally redundant (cheapest option for PoC)

  tags = {
    ApplicationOwner = var.application_owner
    ApplicationName  = var.application_name
  }
}

# Blob Container
resource "azurerm_storage_container" "container" {
  name                  = "documents"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}