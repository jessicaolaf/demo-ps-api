
resource "azurerm_storage_account" "storage_account" {
  name                     = lower("${var.project}${var.environment}demo001")
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
