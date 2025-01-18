resource "azurerm_application_security_group" "asgs" {
    for_each = var.asgs
  name                =each.value.name
  location            = each.value.location
  resource_group_name =each.value.resource_group_name

}