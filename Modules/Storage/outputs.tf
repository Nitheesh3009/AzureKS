output "id" {
  value = azurerm_storage_account.AStorage.id
}

output "name" {
  value = azurerm_storage_account.AStorage.name
}

output "rg_name" {
  value = azurerm_storage_account.AStorage.resource_group_name
}

output "location" {
  value = azurerm_storage_account.AStorage.location
}

output "account_tier" {
  value = azurerm_storage_account.AStorage.account_tier
}

output "account_replication_type" {
  value = azurerm_storage_account.AStorage.account_replication_type
}