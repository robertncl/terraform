# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "location" {
  description = "Azure region"
  default     = "South East Asia"
}

variable "vm_size" {
  description = "Type of Azure VM to provision"
  default     = "Standard_B2s"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "test-resources"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  default     = "test-vnet"
}

variable "subnet_name" {
  description = "Name of the subnet"
  default     = "test-subnet"
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  default     = "test-aks-cluster"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  default     = "testaks"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  default     = 1
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  default     = "testacr"
}

variable "acr_sku" {
  description = "SKU of the Azure Container Registry"
  default     = "Basic"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  default     = "test-app-service-plan"
}

variable "app_service_name" {
  description = "Name of the App Service"
  default     = "test-app-service"
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}



