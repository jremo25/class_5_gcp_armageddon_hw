resource "google_compute_network_peering" "eu-us1" {
  name = "eu-us1"
  network = google_compute_network.eu-vpc.self_link
  peer_network = google_compute_network.us-vpc-1.self_link
}

resource "google_compute_network_peering" "us1-eu" {
  name = "us1-eu"
  network = google_compute_network.us-vpc-1.self_link
  peer_network = google_compute_network.eu-vpc.self_link
}

resource "google_compute_network_peering" "eu-us2" {
  name = "eu-us2"
  network = google_compute_network.eu-vpc.self_link
  peer_network = google_compute_network.us-vpc-2.self_link
}

resource "google_compute_network_peering" "us2-eu" {
  name = "us2-eu"
  network = google_compute_network.us-vpc-2.self_link
  peer_network = google_compute_network.eu-vpc.self_link
}