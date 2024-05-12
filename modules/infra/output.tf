output "vpc" {
  value = google_compute_network.vpc.self_link
}

output "vpc_id" {
  value = google_compute_network.vpc.id
}

output "internal" {
  # value = google_compute_instance.instance.network_interface.0.access_config.0.nat_ip
  value = google_compute_instance.instance.network_interface.0.network_ip
}
output "url" {
  value = var.public_ip ? google_compute_instance.instance.network_interface.0.access_config.0.nat_ip : "None"
}
output "name" {
  value = var.infra_name
}

output "subnet_cidr" {
  value = google_compute_subnetwork.subnet.ip_cidr_range
}