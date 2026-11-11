output "resource_group_name" {
  value = azurerm_resource_group.rg-aks-cluster-tf.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks-cluster-tf.name
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks-cluster-tf.kube_config_raw
  sensitive = true
}