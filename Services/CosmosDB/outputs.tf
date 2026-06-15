output "id" {
  value = module.CosmosDB.id
}

output "name" {
  value = module.CosmosDB.name
}

output "endpoint" {
  value = module.CosmosDB.endpoint
}

output "primary_key" {
  value     = module.CosmosDB.primary_key
  sensitive = true
}

output "connection_strings" {
  value     = module.CosmosDB.connection_strings
  sensitive = true
}
