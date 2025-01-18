data "azurerm_subnet" "sub-data" {
    for_each = var.linux-vms
  name                 =  each.value.subnet_name
  virtual_network_name =  each.value.virtual_network_name
  resource_group_name  =  each.value.resource_group_name
}

data "azurerm_network_security_group" "nsg-data" {
  for_each = var.linux-vms
  name = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_application_security_group" "asgs-data" {
# for_each = var.linux-vms
#   name = each.value.asgs_name
#   resource_group_name = each.value.resource_group_name
# }
data "azurerm_key_vault" "kv-data" {
  for_each = var.linux-vms
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

