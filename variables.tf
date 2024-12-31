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
  default     = "testRG1"
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
  default     = "AKS1"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  default     = "aks1"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  default     = 3
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
  default   	= "9456a85f-e65c-49f5-94be-db117c9369d8"
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default   	= "26316f2f-c05d-49a8-93a7-5d6fc2eb6642"
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  default   	= "a2a6ddbf-d5dd-498c-b612-35799b21ac9c"
}



