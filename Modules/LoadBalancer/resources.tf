resource "azurerm_public_ip" "lb_pip" {
  name                = "${var.name}-pip"
  location            = var.location
  resource_group_name = var.rgname
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "lb" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rgname
  sku                 = var.sku

  frontend_ip_configuration {
    name                 = var.frontend_ip_config_name
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = var.backend_pool_name
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "probe" {
  name            = var.probe_name
  loadbalancer_id = azurerm_lb.lb.id
  protocol        = var.probe_protocol
  port            = var.probe_port
}

resource "azurerm_lb_rule" "lb_rule" {
  name                           = var.rule_name
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = var.rule_protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_ip_config_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.probe.id
}
