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

module "ApplicationGateway" {
  source = "../../Modules/ApplicationGateway"
   name                = var.name
  rgname = var.rgname
  location            = var.location
    backend_address_pool_name = var.backend_address_pool_name
  backend_http_settings_name = var.backend_http_settings_name
      cookie_based_affinity = var.cookie_based_affinity
    path                  = var.path
    port                  = var.port
    protocol              = var.protocol
    request_timeout       = var.request_timeout

    fronted_ip_name                 = var.fronted_ip_name
    public_ip_address_id = var.public_ip_address_id
  

    frontend_port_name = var.frontend_port_name
    frontend_port = var.frontend_port
  

    gateway_ip_configuration_name      = var.gateway_ip_configuration_name
    subnet_id = var.subnet_id
  
 
    http_listener_name                           = var.http_listener_name
    # fronted_ip_name = var.fronted_ip_name
    # frontend_port_name             = var.frontend_port_name
    # protocol                       = var.protocol
  

    request_routing_rule_name                       = var.request_routing_rule_name
    priority                   = var.priority
    rule_type                  = var.rule_type
    # http_listener_name         = var.http_listener_name
    # backend_address_pool_name  = var.backend_address_pool_name
    # backend_http_settings_name = var.backend_http_settings_name
 
    sku_name     = var.sku_name
    sku_tier     = var.sku_tier
    sku_capacity = var.sku_capacity
  
}