variable "rgs" {
  description = "rgs variable is to create multiple rgs using for each"
  type=map(object({
     name = string
    location=string
    managed_by=optional(string)
    tags =optional(map(string))
  }))
  
}

