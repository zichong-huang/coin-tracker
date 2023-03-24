module "helloworld_server" {
  source          = "./modules/cloud-run"
  name            = "helloworld"
  service_version = var.service_version
  project_id      = var.service_project_id
  region          = var.region
}

output "cloud_run_addr" {
  value = module.helloworld_server.cr_entry_point
}

