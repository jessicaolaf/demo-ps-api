terraform {
  backend "azurerm" {
    resource_group_name   = "devops-rg"
    storage_account_name  = "devopsjesssa"
    container_name        = "tfstate"
    key                   = "psapi-demo.terraform.tfstate"
  }
}
