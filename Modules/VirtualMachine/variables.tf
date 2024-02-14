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
 type = list(string)
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

variable "publisher" {
  type = string
}

variable "offer" {
   type = string
}

variable "sku" {
   type = string
}

variable "version1" {
   type = string
}

variable "computername" {
   type = string
}

variable "username" {
   type = string
}

variable "password" {
   type = string
}

variable "disable_password_authentication" {
  type = string
}