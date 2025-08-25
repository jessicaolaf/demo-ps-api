resource "azurerm_windows_function_app" "function_app" {
  name                       = "${var.project}-${var.environment}-func"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_id

  site_config {
    application_stack {
      powershell_core_version = "7.4"
    }
    ftps_state = "Disabled"
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME     = "powershell"
    FUNCTIONS_EXTENSION_VERSION  = "~4"
    WEBSITE_RUN_FROM_PACKAGE     = "1"
    WEBSITE_CONTENTAZUREFILECONNECTIONSTRING = var.storage_account_access_key
    WEBSITE_CONTENTSHARE                      = "psapi-demo-func-content"
  }
}
