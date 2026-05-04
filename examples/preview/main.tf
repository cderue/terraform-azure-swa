terraform {
  required_version = ">= 1.0"
}

module "static_web_app" {
  source = "../.."

  location          = "francecentral"
  env               = "staging"
  app               = "preview-static-web-app"
  repository_url    = "https://github.com/example/frontend-app"
  repository_branch = "develop"
  repository_token  = "example-token"
}

output "static_web_app_url" {
  value = module.static_web_app.azurerm_static_site_url
}