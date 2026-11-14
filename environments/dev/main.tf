# ARM_* environment variables supply the subscription and the OIDC login settings.
provider "azurerm" {
  features {}
}

# Live resource names use the short prefix "careops". Only the project tag carries the
# platform's display name, so renaming the platform never forces a rebuild.
locals {
  name_prefix = "careops-${var.environment}"

  tags = {
    project     = "careops-compliance-platform"
    environment = var.environment
    managed_by  = "terraform"
    owner       = var.owner
    data_class  = "synthetic-only"
  }
}

# Week 1: one resource group proves the pipeline end to end.
# Later weeks add modules for governance, identity, network, monitoring, the app and compliance evidence.
resource "azurerm_resource_group" "main" {
  name     = "rg-${local.name_prefix}"
  location = var.location
  tags     = local.tags
}
