terraform {
  required_version = ">= 1.0"
}

module "static_web_app" {
  source = "../.."

  location            = var.location
  env                 = var.env
  app                 = var.app
  resource_group_name = var.resource_group_name
  repository_url      = var.repository_url
  repository_branch   = var.repository_branch
  repository_token    = var.repository_token
  tags                = var.tags
}