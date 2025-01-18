output"rgs-ids"{
#     value = azurerm_resource_group.rgs.id
  value= {for key in azurerm_resource_group.rgs : key.name =>key.id}
 #[for publicip in azurerm_public_ip.pip-block:publicip.ip_address]
}
  

