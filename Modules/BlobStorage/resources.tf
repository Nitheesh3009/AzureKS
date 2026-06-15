resource "azurerm_storage_account" "blob_storage" {
  name                     = var.name
  resource_group_name      = var.rgname
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = "BlobStorage"
  access_tier              = var.access_tier
}

resource "azurerm_storage_container" "blob_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.blob_storage.name
  container_access_type = var.container_access_type
}
