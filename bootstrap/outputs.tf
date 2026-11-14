output "AZURE_CLIENT_ID" {
  description = "Set as the GitHub repository variable AZURE_CLIENT_ID."
  value       = azuread_application.github.client_id
}

output "AZURE_TENANT_ID" {
  description = "Set as the GitHub repository variable AZURE_TENANT_ID."
  value       = data.azurerm_client_config.current.tenant_id
}

output "AZURE_SUBSCRIPTION_ID" {
  description = "Set as the GitHub repository variable AZURE_SUBSCRIPTION_ID."
  value       = var.subscription_id
}

output "TFSTATE_RG" {
  description = "Set as the GitHub repository variable TFSTATE_RG."
  value       = azurerm_resource_group.state.name
}

output "TFSTATE_SA" {
  description = "Set as the GitHub repository variable TFSTATE_SA."
  value       = azurerm_storage_account.state.name
}
