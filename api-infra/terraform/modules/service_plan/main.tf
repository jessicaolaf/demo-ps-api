resource "azurerm_service_plan" "service_plan" {
  name                = "${var.project}-${var.environment}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Windows"
  sku_name            = "Y1" # Consumption Plan
}
