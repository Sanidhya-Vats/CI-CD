resource "azurerm_network_interface" "nics" {
  for_each            = var.linux-vms
  name                = "${each.value.vm_name}-nic"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "${each.value.vm_name}-ipconfig"
    subnet_id                     = data.azurerm_subnet.sub-data[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id = azurerm_public_ip.pips[each.key].id
  }
}
resource "azurerm_public_ip" "pips" {
    for_each = var.linux-vms
  name                ="${each.value.vm_name}-pip"
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

}
resource "azurerm_network_interface_security_group_association" "nsg-nic-assoc" {
  for_each                  = var.linux-vms
  network_interface_id      = azurerm_network_interface.nics[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg-data[each.key].id
}

resource "random_string" "username" {
  for_each = var.linux-vms
  length   = 12
  special  = false
}

resource "random_password" "password" {
  for_each         = var.linux-vms
  length           = 16
  min_lower        = 3
  min_upper        = 3
  min_numeric      = 2
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "vm-user" {
  for_each     = var.linux-vms
  name         = "${each.value.vm_name}-user"
  value        = random_string.username[each.key].result
  key_vault_id = data.azurerm_key_vault.kv-data[each.key].id
}

resource "azurerm_key_vault_secret" "vm-pass" {
  for_each     = var.linux-vms
  name         = "${each.value.vm_name}-pass"
  value        = random_password.password[each.key].result
  key_vault_id = data.azurerm_key_vault.kv-data[each.key].id
}

resource "azurerm_linux_virtual_machine" "linux-vms" {
  for_each            = var.linux-vms
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  disable_password_authentication = false
  admin_username      = azurerm_key_vault_secret.vm-user[each.key].value
  admin_password      = azurerm_key_vault_secret.vm-pass[each.key].value
  network_interface_ids = [
    azurerm_network_interface.nics[each.key].id,
  ]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}
