locals {

  project_id = "coin-tracker-381614"

  api_services = [
    "appengine.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "container.googleapis.com",
    "containerregistry.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "run.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
  ]
}

# Certain services do not come enabled upon initial project creation, enable them for project
resource "google_project_service" "api" {
  for_each                   = toset(local.api_services)
  project                    = local.project_id
  service                    = each.value
  disable_dependent_services = false
  disable_on_destroy         = false
}
