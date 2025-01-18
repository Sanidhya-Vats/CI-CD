# output"cons-ids"{
# #     value = azurerm_resource_group.rgs.id
#   value= {for key in resource_stroage_container.cons  :key.name =>key.id}
#  #[for publicip in azurerm_public_ip.pip-block:publicip.ip_address]
# }
