resource "azurerm_virtual_machine" "vm1" {
  name = var.name
  resource_group_name = var.rgname
  location = var.location
  network_interface_ids = var.network_interface_ids
    storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version1
  }
  storage_os_disk {
        name              = var.osname
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }
    os_profile {
    computer_name  = var.computername
    admin_username = var.username
    admin_password = var.password
  }
  os_profile_linux_config{
    disable_password_authentication = var.disable_password_authentication
  }
  vm_size = var.vm_size
}