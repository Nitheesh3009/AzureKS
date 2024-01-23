resource "azurerm_subnet" "subnets" {
  resource_group_name = var.rgname
  name = var.name
  virtual_network_name = var.vnetname
  address_prefixes = var.address_prefixes
}