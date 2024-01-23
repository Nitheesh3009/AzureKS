variable "aks_name" {
    type = string
  description = "(Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
}

variable "location" {
    type = string
  description = "(Required) The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created."
}

variable "rgname" {
    type = string
  description = "(Required) Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
}

variable "default_node_pool" {
  type = list(object({
    name = string
    node_count = number
    vm_size = string
  }))
  description = "default node pool is required"
}


