resource "azurerm_application_gateway" "ag" {
  name                = var.name
  resource_group_name = var.rgname
  location            = var.location
  backend_address_pool {
    name = var.backend_address_pool_name
  }
  backend_http_settings {
    name                  = var.backend_http_settings_name
    cookie_based_affinity = var.cookie_based_affinity
    path                  = var.path
    port                  = var.port
    protocol              = var.protocol
    request_timeout       = var.request_timeout
  }
  frontend_ip_configuration {
    name                 = var.fronted_ip_name
    public_ip_address_id = var.public_ip_address_id
  }
  frontend_port {
    name = var.frontend_port_name
    port = var.frontend_port
  }
  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = var.subnet_id
  }
  http_listener {
    name                           = var.http_listener_name
    frontend_ip_configuration_name = var.fronted_ip_name
    frontend_port_name             = var.frontend_port_name
    protocol                       = var.protocol
  }
  request_routing_rule {
    name                       = var.request_routing_rule_name
    priority                   = var.priority
    rule_type                  = var.rule_type
    http_listener_name         = var.http_listener_name
    backend_address_pool_name  = var.backend_address_pool_name
    backend_http_settings_name = var.backend_http_settings_name
  }
  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }
}
