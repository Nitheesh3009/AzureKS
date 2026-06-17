resource "azuread_application" "app" {
  display_name = var.app_display_name
}

resource "azuread_service_principal" "sp" {
  application_id = azuread_application.app.application_id
}

resource "azuread_service_principal_password" "sp_password" {
  service_principal_id = azuread_service_principal.sp.id
  end_date             = var.sp_password_end_date
}

resource "azuread_group" "group" {
  display_name     = var.group_display_name
  security_enabled = true
  mail_enabled     = false
}
