output"vnet-ids-space"{
    
#     value = azurerm_resource_group.rgs.id
  value= {for key in azurerm_virtual_network.vnets : key.name =>{id=key.id, address_space = key.address_space}}
 #[for publicip in azurerm_public_ip.pip-block:publicip.ip_address]
}
