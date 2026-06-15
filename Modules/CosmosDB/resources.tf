resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rgname
  offer_type          = var.offer_type
  kind                = var.kind

  consistency_policy {
    consistency_level = var.consistency_level
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}
