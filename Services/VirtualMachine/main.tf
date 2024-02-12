terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

module "azurerm_virtual_machine" {
  source = "../../Modules/VirtualMachine"
  name = var.name
  rgname = var.rgname
  location = var.location
  network_interface_ids = var.network_interface_ids
  osname = var.osname
  caching = var.caching
  create_option = var.create_option
  managed_disk_type = var.managed_disk_type
  vm_size = var.vm_size
}