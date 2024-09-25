variable "name" {
  description = "The naming prefix for the state backend"
  type        = string
  validation {
    error_message = "The name must can only consist of lowercase letters and numbers, and must be max 13 characters long."
    condition     = can(regex("^[a-z0-9]{0,13}$", var.name))
  }
}

variable "location" {
  description = "The location for the state backend"
  type        = string
  default     = "northeurope"
}

variable "state_container_name" {
  default = "tfstate"
}
