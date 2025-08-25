resource "azurerm_resource_group" "resource_group" {
  name     = "${var.project}-${var.environment}-rg"
  location = var.location
}
