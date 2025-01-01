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

resource "azurerm_data_factory" "test" {
  name                = "adf-2324"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_postgresql_server" "test" {
  name                = "examplepgserver"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name

  sku_name            = "B_Gen5_2"
  storage_mb          = 5120
  backup_retention_days = 7
  administrator_login = "psqladminun"
  administrator_login_password = "H@Sh1CoR3!"

  version             = "11"
  ssl_enforcement_enabled = true

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_postgresql_database" "test" {
  name                = "exampledb"
  resource_group_name = azurerm_resource_group.test.name
  server_name         = azurerm_postgresql_server.test.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_data_factory_linked_service_postgresql" "test" {
  name                = "example-linked-service4"
  data_factory_id     = azurerm_data_factory.test.id

  connection_string = "Host=${azurerm_postgresql_server.test.fqdn};Port=5432;Database=${azurerm_postgresql_database.test.name};UID=psqladminun@examplepgserver;Pwd=${azurerm_postgresql_server.test.administrator_login_password};sslmode=require;"
  description = "Linked service to PostgreSQL"
}

