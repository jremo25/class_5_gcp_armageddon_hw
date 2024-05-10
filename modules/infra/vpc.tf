resource "google_compute_network" "vpc" {
  # project                 = var.project_name
  # name                    = "${var.project_name}-vpc"
  name = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  # project       = var.project_name
  name          = "subnet"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}

