resource "azurerm_network_security_group" "nsg" {
  name = var.name
  location = var.location
  resource_group_name = var.rgname
  security_rule = {
    name = var.rule_name
    priority = var.priority
    direction = var.direction
    access = var.access
    protocol = var.protocol
    
  }
}