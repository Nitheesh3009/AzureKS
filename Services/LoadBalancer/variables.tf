variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "rgname" {
  type = string
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "frontend_ip_config_name" {
  type    = string
  default = "frontend-ip-config"
}

variable "backend_pool_name" {
  type    = string
  default = "backend-pool"
}

variable "probe_name" {
  type    = string
  default = "health-probe"
}

variable "probe_protocol" {
  type    = string
  default = "Tcp"
}

variable "probe_port" {
  type    = number
  default = 80
}

variable "rule_name" {
  type    = string
  default = "lb-rule"
}

variable "rule_protocol" {
  type    = string
  default = "Tcp"
}

variable "frontend_port" {
  type    = number
  default = 80
}

variable "backend_port" {
  type    = number
  default = 80
}
