variable "bastions" {
  type = map(object({
   
    name                 = string
    location             = string
    resource_group_name  = string
    allocation_method    = string
    pip_sku                  = string
    virtual_network_name = string
      virtual_network_id=optional(bool)
  shareable_link_enabled    =optional( bool)
  scale_units               = optional(number)
  kerberos_enabled          =optional( bool)
  ip_connect_enabled        = optional( bool)
  sku                       = optional(string)
  copy_paste_enabled        =optional( bool)
  file_copy_enabled         = optional( bool)
  tags                      = optional(map(string))
  zones                     = optional(list(string))
  tunneling_enabled         =optional( bool)
  session_recording_enabled =optional( bool)
  }))
}
