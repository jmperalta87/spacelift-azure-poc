# Create a simple Resource Group with required tags
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    ApplicationName  = var.application_name
    ApplicationOwner = var.application_owner
  }
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.free_plan.id

  site_config {
    always_on = false
  }

  tags = {
    ApplicationOwner = var.application_owner
    ApplicationName  = var.application_name
  }
}

resource "azurerm_service_plan" "free_plan" {
  name                = "asp-${var.webapp_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "F1"

  tags = {
    ApplicationOwner = var.application_owner
    ApplicationName  = var.application_name
  }
}
