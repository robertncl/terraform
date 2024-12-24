# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.test.name
}

output "aks_cluster_kube_config" {
  value = azurerm_kubernetes_cluster.test.kube_config_raw
}

