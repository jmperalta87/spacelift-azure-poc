variable "resource_group_name" {
  description = "SpaceLift-PoC"
  type        = string
}

variable "location" {
  description = "Azure region for the Resource Group"
  type        = string
  default     = "eastus" # change to your preferred region
}

variable "application_name" {
  description = "SpaceLift"
  type        = string
}

variable "application_owner" {
  description = "DevOps Team"
  type        = string
}