variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "rgname" {
  type = string
}

variable "ip_configuration" {
  type = list(object({
    name = string
    subnet_id = string
    private_ip_address_allocation = string
  })
  )
}