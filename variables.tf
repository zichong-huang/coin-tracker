variable "environment" {
  description = "Name of the current deployment environment."
  type        = string
}

#-------------------------------------------
# Common settings
#-------------------------------------------
variable "region" {
  description = "Region"
  default     = "europe-north1"
}

variable "create_app_engine" {
  description = "Create initial App Engine (cannot be removed)"
  default     = true
}

variable "app_engine_location" {
  description = "App Engine location"
  default     = "europe-north1"
}

variable "service_project_id" {
  description = "Project id for this project"
  default     = "coin-tracker-381614"
}

variable "http_ingress_ranges_to_allow_source" {
  default = ["10.0.0.0/8", "192.168.0.0/16"]
}



#-------------------------------------------
# Generic service settings:
#-------------------------------------------
variable "service_version" {
  type        = string
  description = "The version tag of all services"
  default     = "latest"
}

variable "env" {
  description = "environment"
}

#-------------------------------------------
# Hello World Service settings:
#-------------------------------------------
variable "helloworld_image" {
  type        = string
  description = "Image for hello world service"
  default     = "helloworld"
}
