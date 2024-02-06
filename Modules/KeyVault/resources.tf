resource "azurerm_key_vault" "kv1" {
    name = var.name
    location = var.location
    sku_name = var.sku_name
    tenant_id = var.tenant_id
    resource_group_name = var.rgname
}