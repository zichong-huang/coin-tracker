resource "google_compute_network" "main" {
  name                            = "main"
  project                         = var.service_project_id
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = true
}

resource "google_compute_router" "main" {
  name    = "main-router"
  project = var.service_project_id
  network = google_compute_network.main.name
}

resource "google_compute_router_nat" "main" {
  name                               = "main-cloud-nat"
  project                            = var.service_project_id
  router                             = google_compute_router.main.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_route" "nat" {
  dest_range       = "0.0.0.0/0"
  name             = "default-route"
  project          = var.service_project_id
  network          = google_compute_network.main.self_link
  next_hop_gateway = "default-internet-gateway"
}

resource "google_compute_firewall" "http" {
  name    = "http-ingress-rule"
  project = var.service_project_id
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = var.http_ingress_ranges_to_allow_source
}


resource "google_compute_global_address" "service-network" {
  project       = var.service_project_id
  name          = "service-network"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 20
  network       = google_compute_network.main.self_link
}

resource "google_service_networking_connection" "private-vpc-connection" {
  network                 = google_compute_network.main.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.service-network.name]
}