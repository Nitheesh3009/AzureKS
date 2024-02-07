resource "azurerm_network_interface" "nic" {
    name = var.name
    location = var.location
    resource_group_name = var.rgname
     dynamic "ip_configuration" {
       for_each = var.ip_configuration
       content {
         name = lookup(ip_configuration.value, "name")
         subnet_id = lookup(ip_configuration.value, "subnet_id")
         private_ip_address_allocation = lookup(ip_configuration.value, "private_ip_address_allocation")
         primary = lookup(ip_configuration.value, "primary")

       }
     }
}