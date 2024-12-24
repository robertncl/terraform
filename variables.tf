# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "location" {
  description = "Azure region"
  default     = "West US"
}

variable "vm_size" {
  description = "Type of Azure VM to provision"
  default     = "Standard_B1s"
}

variable "vm_name" {
  description = "Azure VM name"
  default     = "Provisioned by Terraform"
}

