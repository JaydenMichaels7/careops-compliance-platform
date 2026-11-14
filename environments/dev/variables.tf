variable "location" {
  description = "Azure region. South Africa North keeps data in South Africa, which supports POPIA data residency."
  type        = string
  default     = "southafricanorth"
}

variable "environment" {
  description = "Environment name used in resource names and tags."
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Person responsible for these resources (shown in the owner tag)."
  type        = string
  default     = "jayden"
}
