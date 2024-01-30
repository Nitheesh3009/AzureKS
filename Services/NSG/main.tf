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

module "NSG" {
  source = "../../Modules/NSG"
  name = var.name
  location = var.location
  rgname = var.rgname

     rule_name = var.rule_name
    priority = var.priority
    direction = var.direction
    access = var.access
    protocol = var.protocol
    source_port_range = var.source_port_range
    destination_port_range = var.destination_port_range
    source_address_prefix = var.source_address_prefix
    destination_address_prefix = var.destination_address_prefix
}