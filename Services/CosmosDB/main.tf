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

module "CosmosDB" {
  source            = "../../Modules/CosmosDB"
  name              = var.name
  rgname            = var.rgname
  location          = var.location
  offer_type        = var.offer_type
  kind              = var.kind
  consistency_level = var.consistency_level
}
