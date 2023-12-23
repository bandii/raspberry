variable "system_host" {
  type        = string
  nullable    = false
  description = "Host of the Raspberry"
}

variable "system_user" {
  type        = string
  nullable    = false
  description = "UserName to access it"
}
