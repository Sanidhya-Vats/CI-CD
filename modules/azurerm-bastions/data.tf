data "azurerm_subnet" "bas-sub" {
    for_each = {
    for key, value in var.bastions : key => value if value.sku != "Developer"
  }
  
  name                 = "AzureBastionSubnet"
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_virtual_network" "bas-vnet" {
    for_each = { for vnet,vnet_details in var.bastions : vnet  => vnet_details if vnet_details.virtual_network_id== true }
  name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}