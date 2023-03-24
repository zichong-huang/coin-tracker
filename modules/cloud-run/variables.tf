variable "name" {
  description = "Name of the Cloud Run"
}

variable "service_version" {
  description = "The service_version to be used for deployment"
}

variable "region" {
  description = "Region where the Cloud Run to be deployed"
}

variable "project_id" {
  description = "Project where the Cloud Run to be deployed"
}

variable "min_instances" {
  description = "Minimum number of instances to be made ready"
  default     = "25"
}

variable "max_instances" {
  description = "Maximum number of instances allowed to be spawned by GCP"
  default     = "100"
}
