output "id" {
  value = azurerm_cosmosdb_account.cosmosdb.id
}

output "name" {
  value = azurerm_cosmosdb_account.cosmosdb.name
}

output "endpoint" {
  value = azurerm_cosmosdb_account.cosmosdb.endpoint
}

output "primary_key" {
  value     = azurerm_cosmosdb_account.cosmosdb.primary_key
  sensitive = true
}

output "connection_strings" {
  value     = azurerm_cosmosdb_account.cosmosdb.connection_strings
  sensitive = true
}
