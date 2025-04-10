locals {
  default_tags = {
    environment = var.env
    app         = var.app
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "human-talks-rg"
  location = var.location

  tags = local.default_tags
}

resource "azurerm_static_site" "web" {
  name = var.app
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
