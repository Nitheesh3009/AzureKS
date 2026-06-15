terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

module "AzureSQL" {
  source         = "../../Modules/AzureSQL"
  server_name    = var.server_name
  rgname         = var.rgname
  location       = var.location
  server_version = var.server_version
  admin_login    = var.admin_login
  admin_password = var.admin_password
  db_name        = var.db_name
  sku_name       = var.sku_name
}
