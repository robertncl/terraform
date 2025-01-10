# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

// Add outputs for AKS cluster
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
