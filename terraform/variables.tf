variable "location" {
  type        = string
  description = "Azure Region"
  default     = "eastus"
}

variable "node_count" {
  type    = number
  default = 1
  validation {
    condition     = var.node_count >= 1 && var.node_count <= 3
    error_message = "Keep the lab between 1 and 3 nodes plz <3"
  }
}

variable "resource_group_name" {
  type        = string
  description = "AKS Lab Resource Group Name"
}

variable "node_vm_size" {
  type        = string
  description = "AKS Node size"
  default     = "Standard_B2s"
}

variable "os_disk_size_gb" {
  type        = number
  description = "os Disk size for k8s node"
  default     = 30
  validation {
    condition     = var.os_disk_size_gb >= 30 && var.os_disk_size_gb <= 48
    error_message = "Utilize an OS disk size between 30 and 48 GB pls <3"
  }
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes minor version, e.g. 1.37"
}

variable "identity_type" {
  type        = string
  description = "Identity Type"
  default     = "SystemAssigned"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources"
  default     = {}
}

variable "default_node_pool_name" {
  type        = string
  description = "AKS default node pool name"
  default     = "system"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS API server"
}

variable "aks_cluster_name" {
  type        = string
  description = "AKS Cluster name"
}