resource "azurerm_network_security_group" "nsg" {
  name = var.name
  location = var.location
  resource_group_name = var.rgname
  security_rule  {
    name = var.rule_name
    priority = var.priority
    direction = var.direction
    access = var.access
    protocol = var.protocol
    source_port_range = var.source_port_range
    destination_port_range = var.destination_port_range
    source_address_prefix = var.source_address_prefix
    destination_address_prefix = var.destination_address_prefix
  }
}