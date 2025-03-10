variable "waypoint_application" {
  type        = string
  default     = ""
  description = "Waypoint application name."
}

variable "location" {
  description = "Azure infrastructure region"
  type    = string
}

variable "app" {
  description = "Application that we want to deploy"
  type    = string
}
