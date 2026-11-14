output "resource_group_name" {
  description = "Name of the environment's resource group."
  value       = azurerm_resource_group.main.name
}
