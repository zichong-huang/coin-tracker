resource "google_cloud_run_service" "cloud-run" {
  name     = var.name
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/coin-tracker-381614/hello-world"

      }
    }
  }
  metadata {
    annotations = {
      "run.googleapis.com/launch-stage" = "BETA"
    }
  }
  lifecycle {
    ignore_changes = [
      template.0.metadata.0.annotations
    ]
  }

  autogenerate_revision_name = true
  traffic {
    percent         = 100
    latest_revision = true
  }
  #  Enable this block can make it more configuable and make it highly scalable
  #  metadata {
  #   annotations = {
  #     "autoscaling.knative.dev/class"                  = "kpa.autoscaling.knative.dev"
  #     "autoscaling.knative.dev/metric"                 = "cpu-utilization"
  #     "autoscaling.knative.dev/target"                 = "50"
  #     "autoscaling.knative.dev/minScale"                = "1"
  #     "autoscaling.knative.dev/maxScale"                = "10"
  #     "run.googleapis.com/ingress"                      = "all"
  #     "run.googleapis.com/ingress-internal"             = "all"
  #     "run.googleapis.com/load-balancer-type"           = "INTERNAL_SELF_MANAGED"
  #     "run.googleapis.com/region"                       = "europe-north1"
  #   }
  # }
}

# To deploy this in multi-region reployment and make it high availablity

# resource "google_cloud_run_service" "cloud-run" {
#   name     = helloworld-usnorth1
#   location = us-north1

#   template {
#     spec {
#       containers {
#         image = "gcr.io/coin-tracker-381614/hello-world"

#       }
#     }
#   }
#   metadata {
#     annotations = {
#       "run.googleapis.com/launch-stage" = "BETA"
#     }
#   }
#   lifecycle {
#     ignore_changes = [
#       template.0.metadata.0.annotations
#     ]
#   }

#   autogenerate_revision_name = true
#   traffic {
#     percent         = 100
#     latest_revision = true
#   }
# }

resource "google_cloud_run_service_iam_member" "allUsers" {
  service  = google_cloud_run_service.cloud-run.name
  location = google_cloud_run_service.cloud-run.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
