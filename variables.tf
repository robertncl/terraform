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

variable "vm_name" {
  description = "Azure VM name"
  default     = "provisioned-by-terraform"
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

variable "nic_name" {
  description = "Name of the network interface"
  default     = "test-nic"
}

variable "admin_username" {
  description = "Admin username for the VM"
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  default     = "Password1234!"
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



