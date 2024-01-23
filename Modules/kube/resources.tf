resource "azure_kubernetes_cluster" "akscluster"{
    name = var.aks_name
    location = var.location
    resource_group_name = var.rgname
    dns_prefix = var.dns_prefix
    default_node_pool = {
        name = var.node_pool_name
        node_count = var.node_count
        vm_size = var.vm_size
    }
    identity = {
        type = var.identity
    }
}