locals {
  resource_group_name = coalesce(var.resource_group_name, format("%s-%s-rg", var.app, var.env))

  default_tags = merge({
    environment = var.env
    app         = var.app
  }, var.tags)
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location

  tags = local.default_tags
}

resource "azurerm_static_web_app" "web" {
  name                = var.app
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  repository_url      = var.repository_url
  repository_branch   = var.repository_branch
  repository_token    = var.repository_token
}
