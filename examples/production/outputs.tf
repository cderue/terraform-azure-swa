output "static_web_app_url" {
  description = "Default hostname assigned to the production Static Web App."
  value       = module.static_web_app.azurerm_static_site_url
}

output "static_web_app_name" {
  description = "Production Static Web App name."
  value       = module.static_web_app.static_web_app_name
}

output "resource_group_name" {
  description = "Production resource group name."
  value       = module.static_web_app.resource_group_name
}