variable "name" {
  type        = string
  description = "(Required) Specifies the name of the CosmosDB Account. Must be globally unique."
}

variable "rgname" {
  type        = string
  description = "(Required) The name of the resource group in which to create the CosmosDB Account."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists."
}

variable "offer_type" {
  type        = string
  description = "(Required) Specifies the Offer Type to use for this CosmosDB Account. Currently, only Standard is supported."
}

variable "kind" {
  type        = string
  description = "(Required) Specifies the Kind of CosmosDB to create. Valid options are GlobalDocumentDB, MongoDB, and Parse."
}

variable "consistency_level" {
  type        = string
  description = "(Required) The Consistency Level to use for this CosmosDB Account. Valid options are BoundedStaleness, Eventual, Session, Strong, and ConsistentPrefix."
}
