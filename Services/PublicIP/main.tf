terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
 
}

module "PublicIP" {
  source = "../../Modules/PublicIP"
  name = var.name
  rgname = var.rgname
  location = var.location
  allocation_method = var.allocation_method
  sku = var.sku
}
