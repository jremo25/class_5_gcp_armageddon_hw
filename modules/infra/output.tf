output "vpc" {
  value = google_compute_network.vpc.self_link
}

output "internal" {
  # value = google_compute_instance.instance.network_interface.0.access_config.0.nat_ip
  value = google_compute_instance.instance.network_interface.0.network_ip
}
output "url" {
  value = var.public_ip ? google_compute_instance.instance.network_interface.0.access_config.0.nat_ip : "None"
}