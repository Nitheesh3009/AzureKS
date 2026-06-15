resource "azurerm_kubernetes_cluster" "akscluster" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.rgname
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = var.default_node_pool[0].name
    node_count = var.default_node_pool[0].node_count
    vm_size    = var.default_node_pool[0].vm_size
  }

  identity {
    type = var.identity
  }
}