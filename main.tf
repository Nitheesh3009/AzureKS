terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

resource "azurerm_resource_group" "rg" { #creating a resource group
  name = "Terraformrg"
  location = "east us"
}

resource "azurerm_kubernetes_cluster" "akscluster" {
      name = "demo_aks"
    location = "East us"
    resource_group_name = "Terraformrg"
    dns_prefix          = "exampleaks1"
      default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
    identity {
    type = "SystemAssigned"
  }
}
