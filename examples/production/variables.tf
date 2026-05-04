variable "location" {
  description = "Azure region used for the production deployment."
  type        = string
  default     = "westeurope"
}

variable "env" {
  description = "Environment name for the deployment."
  type        = string
  default     = "prod"
}

variable "app" {
  description = "Azure Static Web App name."
  type        = string
  default     = "production-static-web-app"
}

variable "resource_group_name" {
  description = "Explicit Azure resource group name used by production."
  type        = string
  default     = "rg-production-static-web-app-prod"
}

variable "repository_url" {
  description = "Source repository connected to the production Static Web App."
  type        = string
  default     = "https://github.com/example/frontend-app"
}

variable "repository_branch" {
  description = "Branch deployed to production."
  type        = string
  default     = "main"
}

variable "repository_token" {
  description = "Access token used by Azure to read the production repository."
  type        = string
  sensitive   = true
  default     = "example-token"
}

variable "tags" {
  description = "Production tags applied to supported resources."
  type        = map(string)
  default = {
    cost_center = "web-platform"
    criticality = "high"
    owner       = "platform-team"
  }
}