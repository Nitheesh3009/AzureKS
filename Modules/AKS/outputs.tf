output "id"{
    value = azurerm.AKS.akscluster.id
}

output "aks_name" {
    value = azurerm.AKS.akscluster.name
}

output "location" {
  value = azurerm.AKS.akscluster.location
}

output "rgname" {
  value = azurerm.AKS.akscluster.resource_group_name
}