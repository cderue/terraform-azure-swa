variable "waypoint_application" {
  type        = string
  default     = ""
  description = "Legacy Waypoint application name kept for compatibility with existing consumers."
}

variable "resource_group_name" {
  description = "Optional Azure resource group name. When omitted, the module derives a name from app and env."
  type        = string
  default     = null

  validation {
    condition     = var.resource_group_name == null || can(regex("^[A-Za-z0-9._()\\-]{1,90}$", var.resource_group_name))
    error_message = "resource_group_name must be null or a valid Azure resource group name up to 90 characters."
  }
}

variable "location" {
  description = "Azure region where the Static Web App and resource group are created."
  type        = string

  validation {
    condition     = trimspace(var.location) != ""
    error_message = "location must not be empty."
  }
}

variable "env" {
  description = "Short environment identifier such as dev, staging, or prod."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]{2,20}$", var.env))
    error_message = "env must contain 2 to 20 lowercase letters, numbers, or hyphens."
  }
}

variable "app" {
  description = "Application name used for the Azure Static Web App resource."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9](?:[a-z0-9-]{0,58}[a-z0-9])?$", var.app))
    error_message = "app must be 2 to 60 characters, use lowercase letters, numbers, or hyphens, and start and end with an alphanumeric character."
  }
}

variable "repository_url" {
  description = "HTTPS URL of the Git repository connected to Azure Static Web Apps deployments."
  type        = string

  validation {
    condition     = can(regex("^https://.+", var.repository_url))
    error_message = "repository_url must be a valid HTTPS URL."
  }
}

variable "repository_branch" {
  description = "Repository branch monitored by Azure Static Web Apps for deployments."
  type        = string

  validation {
    condition     = trimspace(var.repository_branch) != "" && !can(regex("\\s", var.repository_branch))
    error_message = "repository_branch must not be empty or contain whitespace."
  }
}

variable "repository_token" {
  description = "Access token used by Azure Static Web Apps to read the source repository."
  type        = string
  sensitive   = true

  validation {
    condition     = trimspace(var.repository_token) != ""
    error_message = "repository_token must not be empty."
  }
}

variable "tags" {
  description = "Additional tags merged with the default app and environment tags on supported resources."
  type        = map(string)
  default     = {}

  validation {
    condition     = alltrue([for key, value in var.tags : trimspace(key) != "" && trimspace(value) != ""])
    error_message = "tags keys and values must not be empty strings."
  }
}
