resource "azurerm_key_vault" "keyvaults" {
  for_each                   = var.keyvaults
  name                       = each.value.name
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  tenant_id                  = data.azurerm_client_config.client-config.tenant_id
  soft_delete_retention_days = each.value.soft_delete_retention_days
  purge_protection_enabled   = each.value.purge_protection_enabled
  sku_name = each.value.sku_name
  access_policy {
    tenant_id = data.azurerm_client_config.client-config.tenant_id
    object_id = data.azurerm_client_config.client-config.object_id
    key_permissions = each.value.key_permissions
    secret_permissions = each.value.secret_permissions
    storage_permissions     = each.value.secret_permissions
    certificate_permissions = each.value.certificate_permissions
  }
}
