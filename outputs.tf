output "azurerm_static_site_url" {
  value = azurerm_static_web_app.web.default_host_name
}
