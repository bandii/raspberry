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

variable "system_password" {
  type        = string
  nullable    = false
  description = "Password to access it"
}

# Modify the provider called 'system' if you want another auth