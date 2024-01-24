variable "name" {
  type = string
}
variable "rgname" {
  type = string
}
variable "location" {
  type = string
}
variable "backend_address_pool_name" {
  type = string
}
variable "backend_http_settings_name" {
  type = string
}
variable "cookie_based_affinity" {
  type = string
}


variable "path" {
  type = string
}
variable "port" {
  type = string
}
variable "protocol" {
  type = string
}
variable "request_timeout" {
  type = string
}

variable "fronted_ip_name" {
  type = string
}

variable "public_ip_address_id" {
  type = string
}

variable "frontend_port_name" {
  type = string
}
variable "frontend_port" {
  type = string
}
variable "gateway_ip_configuration_name" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "http_listener_name" {
  type = string
}
variable "request_routing_rule_name" {
  type = string
}

variable "priority" {
  type = string
}

variable "rule_type" {
  type = string
}
variable "sku_name" {
  type = string
}
variable "sku_tier" {
  type = string
}
variable "sku_capacity" {
  type = string
}