# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.test.name
}

output "aks_cluster_kube_config" {
  value = azurerm_kubernetes_cluster.test.kube_config_raw
  sensitive = true
}

output "acr_name" {
  value = azurerm_container_registry.test.name
}

output "acr_login_server" {
  value = azurerm_container_registry.test.login_server
}

output "app_service_default_site_hostname" {
  value = azurerm_app_service.test.default_site_hostname
}

