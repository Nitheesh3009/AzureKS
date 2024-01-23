terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

module "Kube" {
    source = "../../Modules/Kube"
    rgname = var.rgname
    aks_name = var.aks_name
    location = var.location
    dns_prefix = var.dns_prefix
    default_node_pool = var.default_node_pool
    identity = var.identity
}