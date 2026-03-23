variable "resource_group_name" {
  description = "Name of the resource Group"
  type        = string
  default     = "SpaceLift-PoC"
}

variable "location" {
  description = "Azure region for the Resource Group"
  type        = string
  default     = "eastus" # change to your preferred region
}

variable "application_name" {
  description = "Name of the Application"
  type        = string
  default     = "SpaceLift"
}

variable "application_owner" {
  description = "Name of the Owner"
  type        = string
  default     = "DevOps Team"
}