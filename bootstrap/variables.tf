variable "subscription_id" {
  description = "Azure subscription ID to deploy into."
  type        = string
}

variable "github_org" {
  description = "GitHub username or organisation that owns the repository."
  type        = string
}

variable "github_owner_id" {
  description = "Numeric GitHub ID of the owner. GitHub puts it in the OIDC subject for this repository."
  type        = string
}

variable "github_repo_id" {
  description = "Numeric GitHub ID of the repository."
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name. It is part of the OIDC login rule, so it must match exactly."
  type        = string
  default     = "careops-compliance-platform"
}

variable "location" {
  description = "Azure region for the state storage. South Africa North keeps data in South Africa."
  type        = string
  default     = "southafricanorth"
}
