variable "prefix" {
  description = "Name prefix"
  type        = string
  default     = "g360"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "australiaeast"
}

variable "instance_count" {
  description = "VM count"
  type        = number
  default     = 2
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
}
