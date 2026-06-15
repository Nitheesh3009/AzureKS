output "storage_account_id" {
  value = azurerm_storage_account.blob_storage.id
}

output "storage_account_name" {
  value = azurerm_storage_account.blob_storage.name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.blob_storage.primary_blob_endpoint
}

output "container_id" {
  value = azurerm_storage_container.blob_container.id
}

output "container_name" {
  value = azurerm_storage_container.blob_container.name
}
