variable "name" {
  type        = string
  description = "(Required) Specifies the name of the storage account. Only lowercase alphanumeric characters allowed. Must be unique across Azure."
}

variable "rgname" {
  type        = string
  description = "(Required) The name of the resource group in which to create the storage account."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists."
}

variable "account_tier" {
  type        = string
  description = "(Required) Defines the tier for this storage account. Valid options are Standard and Premium."
}

variable "account_replication_type" {
  type        = string
  description = "(Required) Defines the replication type. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
}

variable "access_tier" {
  type        = string
  description = "(Required) Defines the access tier for BlobStorage accounts. Valid options are Hot and Cool."
}

variable "container_name" {
  type        = string
  description = "(Required) The name of the storage container."
}

variable "container_access_type" {
  type        = string
  description = "(Required) The access level of the container. Valid options are private, blob, and container."
}
