resource "azurerm_resource_group" "rg-aks-cluster-tf" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_kubernetes_cluster" "aks-cluster-tf" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.rg-aks-cluster-tf.location
  resource_group_name = azurerm_resource_group.rg-aks-cluster-tf.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = var.default_node_pool_name
    os_disk_size_gb = var.os_disk_size_gb
    node_count      = var.node_count
    vm_size         = var.node_vm_size
  }

  identity {
    type = var.identity_type
  }

  tags = var.tags

}

