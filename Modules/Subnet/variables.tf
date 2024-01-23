variable "rgname" {
  type = string
  description = "(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
}

variable "name" {
  type = string
  description = "(Required) The name of the subnet. Changing this forces a new resource to be created."
}

variable "vnetname" {
  type = string
  description = " (Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
}

variable "address_prefixes" {
  type = list(string)
  description = "(Required) The address prefixes to use for the subnet."
}