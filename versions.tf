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

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.28.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.13.0"
    }
  }

  required_version = ">= 1.9.0"
}
