resource "azurerm_public_ip" "bas-pips" {
  for_each = {
    for key, value in var.bastions : key => value if value.sku != "Developer"
  }

  name                = "${each.value.name}-pip"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.pip_sku
}

resource "azurerm_bastion_host" "bastions" {
  for_each                  = var.bastions
  name                      = each.value.name
  location                  = each.value.location
  resource_group_name       = each.value.resource_group_name
  virtual_network_id        = lookup(each.value, "sku", null) == "Developer"? data.azurerm_virtual_network.bas-vnet[each.key].id : null
  shareable_link_enabled    = each.value.shareable_link_enabled
  scale_units               = each.value.scale_units
  kerberos_enabled          = each.value.kerberos_enabled
  ip_connect_enabled        = each.value.ip_connect_enabled
  sku                       = each.value.sku
  copy_paste_enabled        = each.value.copy_paste_enabled
  file_copy_enabled         = each.value.file_copy_enabled
  tags                      = each.value.tags
  zones                     = each.value.zones
  tunneling_enabled         = each.value.tunneling_enabled
  session_recording_enabled = each.value.session_recording_enabled
   dynamic "ip_configuration" {
    for_each = lookup(each.value, "sku", null) == "Developer" ? [] : [1]  # Empty list for "Developer", non-empty for others

    content {
      name                 = "${each.value.name}-ip-config"
      subnet_id            = data.azurerm_subnet.bas-sub[each.key].id
      public_ip_address_id = azurerm_public_ip.bas-pips[each.key].id
    }
  }
}

