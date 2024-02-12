variable "name" {
  type = string
}

variable "rgname" {
  type = string
}

variable "location" {
  type = string
}

variable "network_interface_ids" {
 type = list()
}   

variable "osname" {
  type = string
}

variable "caching" {
  type = string
}

variable "create_option" {
  type = string
}

variable "managed_disk_type" {
  type = string
}

variable "vm_size" {
  type = string
}