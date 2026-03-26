resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location

  tags = {
    ApplicationOwner = var.owner
    ApplicationName  = var.app_name
  }
}