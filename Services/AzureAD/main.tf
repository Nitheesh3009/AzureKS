terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.0.0"
    }
  }
}

provider "azuread" {}

module "AzureAD" {
  source               = "../../Modules/AzureAD"
  app_display_name     = var.app_display_name
  sp_password_end_date = var.sp_password_end_date
  group_display_name   = var.group_display_name
}
