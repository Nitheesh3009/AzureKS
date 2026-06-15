variable "server_name" {
  type        = string
  description = "(Required) The name of the Azure SQL Server. Must be globally unique."
}

variable "rgname" {
  type        = string
  description = "(Required) The name of the resource group in which to create the SQL Server."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists."
}

variable "server_version" {
  type        = string
  description = "(Required) The version of the SQL Server. Valid values are 2.0 and 12.0."
}

variable "admin_login" {
  type        = string
  description = "(Required) The administrator login username for the SQL Server."
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "(Required) The administrator login password for the SQL Server."
}

variable "db_name" {
  type        = string
  description = "(Required) The name of the SQL Database."
}

variable "sku_name" {
  type        = string
  description = "(Required) The SKU name for the database. Examples: Basic, S0, S1, P1, GP_Gen5_2."
}
