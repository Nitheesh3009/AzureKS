output "id" {
  value = azurerm_lb.lb.id
}

output "public_ip_address" {
  value = azurerm_public_ip.lb_pip.ip_address
}

output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}

output "frontend_ip_config_name" {
  value = azurerm_lb.lb.frontend_ip_configuration[0].name
}
