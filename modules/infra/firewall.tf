resource "google_compute_firewall" "rules" {
  name        = "${var.infra_name}-fwr"
  network     = google_compute_network.vpc.self_link
  description = "Firewall rules to open SSH"

  allow {
    protocol = "tcp"
    ports    = var.open_ports
  }

  source_ranges = ["0.0.0.0/0"]

  # source_tags = []
  target_tags = []

}