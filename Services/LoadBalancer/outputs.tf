output "id" {
  value = module.LoadBalancer.id
}

output "public_ip_address" {
  value = module.LoadBalancer.public_ip_address
}

output "backend_pool_id" {
  value = module.LoadBalancer.backend_pool_id
}

output "frontend_ip_config_name" {
  value = module.LoadBalancer.frontend_ip_config_name
}
