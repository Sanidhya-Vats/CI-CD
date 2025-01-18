variable "stgs" {
  description = "stgs variable is to create multiple storage accounts using for_each"
  type = map(object({
    name                = string
    resource_group_name         = string
    location                    = string
    account_replication_type   = string
    account_tier                = string
    account_kind                =optional(string)
    cross_tenant_replication_enabled = optional(bool)
    access_tier                 = optional(string)
    edge_zone                   = optional(string)
    https_traffic_only_enabled  = optional(bool)
    min_tls_version             = optional(string)
  }))
}

