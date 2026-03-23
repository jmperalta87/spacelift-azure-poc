# Create a simple Resource Group with required tags
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    ApplicationName  = var.application_name
    ApplicationOwner = var.application_owner
  }
}