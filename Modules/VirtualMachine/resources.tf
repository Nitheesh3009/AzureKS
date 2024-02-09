resource "azurerm_virtual_machine" "vm1" {
  name = var.name
  resource_group_name = var.rgname
  location = var.location
  network_interface_ids = var.network_interface_ids
  storage_os_disk {
        name              = var.osname
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }
  vm_size = var.vm_size
}