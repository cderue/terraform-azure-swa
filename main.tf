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

resource "azurerm_static_web_app" "web" {
  name = var.app
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  repository_url = var.repository_url
  repository_branch = var.repository_branch
}
