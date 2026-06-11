output "id" {
  value = azurerm_kubernetes_cluster.akscluster.id
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.akscluster.name
}

output "location" {
  value = azurerm_kubernetes_cluster.akscluster.location
}

output "rgname" {
  value = azurerm_kubernetes_cluster.akscluster.resource_group_name
}