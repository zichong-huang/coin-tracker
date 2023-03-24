output "cr_entry_point" {
  description = "Entry point of the cloud run"
  value       = google_cloud_run_service.cloud-run.status[0].url
}