
resource "azurerm_resource_group" "rg-aks-cluster-tf" {
    name = "rg-aks-cluster-tf"
    location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks-cluster-tf" {
    name                =   "aks-cluster-tf"
    location            = azurerm_resource_group.rg-aks-cluster-tf.location
    resource_group_name = azurerm_resource_group.rg-aks-cluster-tf.name
    dns_prefix            = "aksclustertf"

    default_node_pool {
        name = "name"
        node_count = 1
        vm_size = "Standard_D2_v2"
    }

    identity { 
        type = "SystemAssigned"
    }

    tags = {
        Environment = "Production"
    }

}

output "client_certificate" {
    value   =   azurerm_kubernetes_cluster.aks-cluster-tf.kube_config[0].client_certificate
    sensitive = true
}

output "kube_config" {
    value = azurerm_kubernetes_cluster.aks-cluster-tf.kube_config_raw
    sensitive = true
}