output "application_id" {
  value = azuread_application.app.application_id
}

output "service_principal_id" {
  value = azuread_service_principal.sp.id
}

output "sp_client_secret" {
  value     = azuread_service_principal_password.sp_password.value
  sensitive = true
}

output "group_id" {
  value = azuread_group.group.id
}
