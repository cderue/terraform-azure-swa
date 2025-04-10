variable "waypoint_application" {
  type        = string
  default     = ""
  description = "Waypoint application name."
}

variable "location" {
  description = "Azure infrastructure region"
  type        = string
}

variable "env" {
  description = "Application env"
  type        = string
}

variable "app" {
  description = "Application that we want to deploy"
  type        = string
}

variable "repository_url" {
  description = "GitHub repository used for deployment"
  type        = string
}

variable "repository_branch" {
  description = "GitHub repository branch used for deployment"
  type        = string
}

variable "repository_token" {
  description = "GitHub repository token"
  type        = string
}
