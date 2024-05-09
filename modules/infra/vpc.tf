# Europe
resource "google_compute_network" "vpc" {
  provider = google.armageddon-eu
  project                 = var.project_name
  name                    = "${var.project_name}-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  # provider = google.armageddon-eu
  name          = "subnet"
  #ip_cidr_range = "10.210.1.0/24"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = var.vpc_id
}

