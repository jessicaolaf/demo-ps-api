provider "azurerm" {
  features {}
}

module "rg" {
  source      = "../modules/resource_group"
  project     = var.project_name
  environment = var.environment
  location    = var.location
}

module "storage" {
  source              = "../modules/storage"
  resource_group_name = module.rg.name
  location            = var.location
  project             = var.project_name
  environment         = var.environment
}

module "plan" {
  source              = "../modules/service_plan"
  resource_group_name = module.rg.name
  location            = var.location
  project             = var.project_name
  environment         = var.environment
}

module "function_app" {
  source                = "../modules/function_app"
  resource_group_name   = module.rg.name
  location              = var.location
  project               = var.project_name
  environment           = var.environment
  storage_account_name  = module.storage.name
  storage_account_id    = module.storage.id
  app_service_plan_id   = module.plan.id
}
