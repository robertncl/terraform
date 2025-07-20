# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "location" {
  description = "Azure region"
  default     = "South East Asia"
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "demo-rg"
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
  description = "The name of the AKS cluster"
  type        = string
  default     = "exampleaks"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  default     = "aks1"
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
  default   	= "9456a85f-e65c-49f5-94be-db117c9369d8"
}



variable "postgres_server_name" {
  description = "The name of the PostgreSQL Flexible Server."
  type        = string
  default     = "example-postgres"
}

variable "postgres_admin_username" {
  description = "The administrator username for PostgreSQL."
  type        = string
  default     = "psqladmin"
}

variable "postgres_admin_password" {
  description = "The administrator password for PostgreSQL."
  type        = string
  sensitive   = true
  default     = "ChangeMe123!"
}

variable "postgres_sku_name" {
  description = "The SKU name for the PostgreSQL Flexible Server."
  type        = string
  default     = "Standard_B1ms"
}

variable "postgres_version" {
  description = "The version of PostgreSQL to use."
  type        = string
  default     = "15"
}

variable "postgres_storage_mb" {
  description = "The max storage allowed for the PostgreSQL Flexible Server in MB."
  type        = number
  default     = 32768
}
