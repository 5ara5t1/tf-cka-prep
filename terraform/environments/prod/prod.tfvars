resource_group_name = "rg-aks-cluster-tf"
aks_cluster_name    = "aks-cluster-tf"
dns_prefix          = "aksclustertf"
kubernetes_version  = "1.37"
tags = {
  env     = "lab"
  project = "cka-prep"
}

