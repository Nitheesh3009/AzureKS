terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}  
}

module "Storage" {
  source = "../../Modules/Storage"
    name = var.name
  rg_name = var.rg_name
  location = var.location
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type
}