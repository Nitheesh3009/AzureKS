variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "rgname" {
  type = string
}

variable "rule_name" {
  type = string
}

variable "priority" {
  type = number
}

variable "direction" {
  type = string
}

variable "access" {
  type = string
}

variable "protocol" {
  type = string
  description = "value"
}

variable "source_port_range" {
  type = string
}
variable "destination_port_range" {
  type = string
}
variable "destination_address_prefix" {
  type = string
}
variable "source_address_prefix" {
  type = string
}