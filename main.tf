# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
#  backend "remote" {
#    organization = "example-org-5715b1"
#
#    workspaces {
#      name = "getting-started"
#    }
#  }
    backend "kubernetes" {
      secret_suffix    = "state"
      config_path      = "~/.kube/config"
    }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  
}

resource "azurerm_resource_group" "test" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "test" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
}

resource "azurerm_subnet" "test" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_virtual_network" "databricks_vnet" {
  name                = var.databricks_vnet_name
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
}

resource "azurerm_subnet" "databricks_subnet" {
  name                 = var.databricks_subnet_name
  resource_group_name  = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.databricks_vnet.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_subnet" "databricks_private_subnet" {
  name                 = var.databricks_private_subnet_name
  resource_group_name  = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.databricks_vnet.name
  address_prefixes     = ["10.1.2.0/24"]

  delegations {
    name = "databricks-delegation"
    service_delegation {
      name = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

resource "azurerm_network_security_group" "databricks_nsg" {
  name                = "databricks-nsg"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name

  security_rule {
    name                       = "AllowAllInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowAllOutbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "databricks_public_subnet_nsg" {
  subnet_id                 = azurerm_subnet.databricks_subnet.id
  network_security_group_id = azurerm_network_security_group.databricks_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "databricks_private_subnet_nsg" {
  subnet_id                 = azurerm_subnet.databricks_private_subnet.id
  network_security_group_id = azurerm_network_security_group.databricks_nsg.id
}

resource "azurerm_kubernetes_cluster" "test" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  tags = {
    Environment = "Test"
  }
}

resource "azurerm_databricks_workspace" "test" {
  name                = "databricks-test"
  resource_group_name = azurerm_resource_group.test.name
  location            = azurerm_resource_group.test.location
  sku                 = "standard"

  custom_parameters {
    virtual_network_id                                 = azurerm_virtual_network.databricks_vnet.id
    public_subnet_name                                 = azurerm_subnet.databricks_subnet.name
    private_subnet_name                                = azurerm_subnet.databricks_private_subnet.name
    public_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.databricks_public_subnet_nsg.id
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.databricks_private_subnet_nsg.id
  }

  tags = {
    Environment = "Production"
  }
}