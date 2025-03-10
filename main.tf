resource "azurerm_static_site" "web" {
  name = "hashitalks-2025"
  resource_group_name = azurerm_resource_group.rg.name
  location = "eastus"
}
