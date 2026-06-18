terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

module "LoadBalancer" {
  source                  = "../../Modules/LoadBalancer"
  name                    = var.name
  location                = var.location
  rgname                  = var.rgname
  sku                     = var.sku
  frontend_ip_config_name = var.frontend_ip_config_name
  backend_pool_name       = var.backend_pool_name
  probe_name              = var.probe_name
  probe_protocol          = var.probe_protocol
  probe_port              = var.probe_port
  rule_name               = var.rule_name
  rule_protocol           = var.rule_protocol
  frontend_port           = var.frontend_port
  backend_port            = var.backend_port
}
