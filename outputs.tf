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

output "postgres_fqdn" {
  description = "The FQDN of the PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "postgres_admin_username" {
  description = "The admin username for the PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.postgres.administrator_login
}

output "nginx_ingress_namespace" {
  description = "Namespace where NGINX ingress controller is deployed"
  value       = helm_release.nginx_ingress.namespace
}

output "nginx_ingress_status" {
  description = "Status of the NGINX ingress controller deployment"
  value       = helm_release.nginx_ingress.status
}
