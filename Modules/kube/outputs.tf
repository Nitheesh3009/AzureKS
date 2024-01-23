output "id"{
    value = azurerm.kube.akscluster.id
}

output "aks_name" {
    value = azurerm.kube.akscluster.name
}

output "location" {
  value = azurerm.kube.akscluster.location
}

output "rgname" {
  value = azurerm.kube.akscluster.resource_group_name
}