# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.test.name
}

output "aks_cluster_kube_config" {
  value = azurerm_kubernetes_cluster.test.kube_config_raw
  sensitive = true
}

output "public_ip" {
  value = azurerm_public_ip.test.ip_address
}

output "vault_uri" {
  value = data.azurerm_key_vault.test.vault_uri
}