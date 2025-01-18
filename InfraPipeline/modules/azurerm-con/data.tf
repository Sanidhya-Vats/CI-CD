data "azurerm_storage_account" "stgs-data" {
    for_each = var.cons
  name =each.value.storage_account_name
  resource_group_name = each.value.resource_group_name
}