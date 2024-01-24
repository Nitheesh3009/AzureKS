variable "name" {
  type = string
}

variable "rgname" {
  type = string
}
variable "location" {
  type = string
}
variable "allocation_method" {
  type = string
  default = "dynamic"
}
variable "sku" {
  type = string
}