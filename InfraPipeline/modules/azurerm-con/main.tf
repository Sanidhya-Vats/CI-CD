resource "azurerm_storage_container" "cons" {
    for_each = var.cons
  name = each.value.name
  storage_account_id = data.azurerm_storage_account.stgs-data[each.key].id
}

