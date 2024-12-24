# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "vm_id" {
  value = azurerm_virtual_machine.vm.id
}

output "vm_name" {
  value = azurerm_virtual_machine.vm.name
}

