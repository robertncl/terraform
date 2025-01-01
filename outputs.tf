# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
output "id" {
  value = azurerm_data_factory.test.id
}

output "postgresql_server_name" {
  value = azurerm_postgresql_server.test.name
}