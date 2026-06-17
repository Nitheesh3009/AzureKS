output "application_id" {
  value = module.AzureAD.application_id
}

output "service_principal_id" {
  value = module.AzureAD.service_principal_id
}

output "sp_client_secret" {
  value     = module.AzureAD.sp_client_secret
  sensitive = true
}

output "group_id" {
  value = module.AzureAD.group_id
}
