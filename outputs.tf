output "azurerm_static_site_url" {
  description = "Default hostname assigned to the Azure Static Web App."
  value       = azurerm_static_web_app.web.default_host_name
}

output "static_web_app_id" {
  description = "Resource ID of the Azure Static Web App."
  value       = azurerm_static_web_app.web.id
}

output "static_web_app_name" {
  description = "Name of the Azure Static Web App."
  value       = azurerm_static_web_app.web.name
}

output "resource_group_name" {
  description = "Name of the resource group hosting the Static Web App."
  value       = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "Resource ID of the resource group hosting the Static Web App."
  value       = azurerm_resource_group.rg.id
}
