output "id" {
  value = azurerm_virtual_network.vnet.id
}

output "name" {
  value = azurerm_virtual_network.vnet.name
}

output "rgname" {
  value = azurerm_virtual_network.vnet.resource_group_name
}

output "location" {
  value = azurerm_virtual_network.vnet.location
}

output "address_space" {
  value = azurerm_virtual_network.vnet.address_space
}