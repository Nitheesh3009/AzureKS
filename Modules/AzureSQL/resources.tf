resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.rgname
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
}

resource "azurerm_mssql_database" "sql_database" {
  name      = var.db_name
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = var.sku_name
}
