variable "project_name" {
  description = "Name of the project"
  type        = string
  default = "psapi"
}

variable "environment" {
  description = "Environment (e.g. dev, prod)"
  type        = string
  default = "demo"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central US"
}
