resource "azurerm_static_site" "web" {
  name = "hashitalks-2025"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
}

resource "azapi_update_resource" "web" {
  type = "Microsoft.Web/staticSites@2024-04-01"
  resource_id = azurerm_static_site.web.id
  body = jsonencode({
    properties = {
      repositoryUrl = "https://github.com/cderue/hashitalks-2025"
      branch = "main"
    }
  })
}
