output "storage_account_id" {
  value = module.BlobStorage.storage_account_id
}

output "storage_account_name" {
  value = module.BlobStorage.storage_account_name
}

output "primary_blob_endpoint" {
  value = module.BlobStorage.primary_blob_endpoint
}

output "container_id" {
  value = module.BlobStorage.container_id
}

output "container_name" {
  value = module.BlobStorage.container_name
}
