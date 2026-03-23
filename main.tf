# Create a simple Resource Group with required tags
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    ApplicationName  = var.application_name
    ApplicationOwner = var.application_owner
  }
}

# App Service Plan - Free Linux tier
resource "azurerm_service_plan" "free_plan" {
  name                = "asp-spacelift-poc"
  resource_group_name = azurerm_resource_group.rg.name      # ✅ Reference the RG dynamically
  location            = azurerm_resource_group.rg.location   # ✅ Fixed: rg not main
  os_type             = "Linux"
  sku_name            = "F1"

  tags = {
    ApplicationOwner = var.application_owner
    ApplicationName  = var.application_name
  }
}

# Linux Web App
resource "azurerm_linux_web_app" "webapp" {
  name                = "webapp-spacelift-poc"
  resource_group_name = azurerm_resource_group.rg.name       # ✅ Reference the RG dynamically
  location            = azurerm_resource_group.rg.location    # ✅ Fixed: rg not main
  service_plan_id     = azurerm_service_plan.free_plan.id

  site_config {
    always_on = false
  }

  tags = {
    ApplicationOwner = var.application_owner
    ApplicationName  = var.application_name
  }
}

# Test resource - missing tags on purpose
resource "azurerm_service_plan" "test_no_tags" {
  name                = "asp-test-no-tags"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "F1"
}