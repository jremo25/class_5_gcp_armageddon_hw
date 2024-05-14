resource "google_compute_network_peering" "eu-us1" {
  name         = "eu-us1"
  network      = module.infra-eu.vpc
  peer_network = module.infra-us-1.vpc
}

resource "google_compute_network_peering" "us1-eu" {
  name         = "us1-eu"
  network      = module.infra-us-1.vpc
  peer_network = module.infra-eu.vpc

  depends_on = [ google_compute_network_peering.eu-us1 ]
}

resource "google_compute_network_peering" "eu-us2" {
  name         = "eu-us2"
  network      = module.infra-eu.vpc
  peer_network = module.infra-us-2.vpc

  depends_on = [ google_compute_network_peering.us1-eu ]
}

resource "google_compute_network_peering" "us2-eu" {
  name         = "us2-eu"
  network      = module.infra-us-2.vpc
  peer_network = module.infra-eu.vpc

  depends_on = [ google_compute_network_peering.eu-us2 ]
}

resource "google_compute_network_peering" "us1-us2" {
  name         = "us1-us2"
  network      = module.infra-us-1.vpc
  peer_network = module.infra-us-2.vpc

  depends_on = [ google_compute_network_peering.us2-eu ]
}

resource "google_compute_network_peering" "us2-us1" {
  name         = "us2-us1"
  network      = module.infra-us-2.vpc
  peer_network = module.infra-us-1.vpc

  depends_on = [ google_compute_network_peering.us1-us2 ]
}

# resource "google_compute_network_peering" "eu-us1" {
#   name = "eu-us1"
#   network = google_compute_network.eu-vpc.self_link
#   peer_network = google_compute_network.us-vpc-1.self_link
# }

# resource "google_compute_network_peering" "us1-eu" {
#   name = "us1-eu"
#   network = google_compute_network.us-vpc-1.self_link
#   peer_network = google_compute_network.eu-vpc.self_link
# }

# resource "google_compute_network_peering" "eu-us2" {
#   name = "eu-us2"
#   network = google_compute_network.eu-vpc.self_link
#   peer_network = google_compute_network.us-vpc-2.self_link
# }

# resource "google_compute_network_peering" "us2-eu" {
#   name = "us2-eu"
#   network = google_compute_network.us-vpc-2.self_link
#   peer_network = google_compute_network.eu-vpc.self_link
# }