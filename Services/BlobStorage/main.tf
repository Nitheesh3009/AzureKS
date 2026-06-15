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

module "BlobStorage" {
  source                   = "../../Modules/BlobStorage"
  name                     = var.name
  rgname                   = var.rgname
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  container_name           = var.container_name
  container_access_type    = var.container_access_type
}
