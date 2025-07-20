# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.37.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }

  required_version = ">= 1.9.0"
}
