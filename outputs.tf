# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "vm_id" {
  value = azurerm_linux_virtual_machine.example.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.example.name
}

