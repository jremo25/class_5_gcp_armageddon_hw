# resource "google_compute_global_address" "eu-eip" {
#   name = "eu-elastic-ip"
#   address_type = "EXTERNAL"
#   ip_version = "IPV4"
# }

# resource "google_compute_global_address" "asia-eip" {
#   name = "asia-elastic-ip"
#   address_type = "EXTERNAL"
#   ip_version = "IPV4"
# }

resource "google_compute_vpn_gateway" "eu-gateway" {
  project = "armageddon-eu"
  name = "vpn-1"
  network = module.infra-eu.vpc_id
}

resource "google_compute_vpn_gateway" "asia-gateway" {
  project = "armageddon-as"
  name = "vpn-1"
  network = module.infra-asia.vpc_id
}

resource "google_compute_address" "eu-vpn_static_ip" {
  project = "armageddon-eu"
  name = "${module.infra-eu.name}-vpn-1"
  address_type = "EXTERNAL"
  ip_version = "IPV4"
}

resource "google_compute_address" "asia-vpn_static_ip" {
  project = "armageddon-as"
  name = "${module.infra-asia.name}-vpn-1"
  address_type = "EXTERNAL"
  ip_version = "IPV4"
}

resource "google_compute_forwarding_rule" "eu-fr_esp" {
  project = "armageddon-eu"
  name = "${module.infra-eu.name}-fr-esp"
  ip_protocol = "ESP"
  ip_address = google_compute_address.eu-vpn_static_ip.address
  target      = google_compute_vpn_gateway.asia-gateway.id

  depends_on = [ google_compute_vpn_gateway.asia-gateway ]
}

resource "google_compute_forwarding_rule" "asia-fr_esp" {
  project = "armageddon-as"
  name = "${module.infra-asia.name}-fr-esp"
  ip_protocol = "ESP"
  ip_address = google_compute_address.asia-vpn_static_ip.address
  target      = google_compute_vpn_gateway.eu-gateway.id
}

resource "google_compute_forwarding_rule" "eu-fr_udp500" {
  project = "armageddon-eu"
  name        = "${module.infra-eu.name}-fr-udp500"
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = google_compute_address.eu-vpn_static_ip.address
  target      = google_compute_vpn_gateway.asia-gateway.id
}

resource "google_compute_forwarding_rule" "asia-fr_udp500" {
  project = "armageddon-as"
  name        = "${module.infra-asia.name}-fr-udp500"
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = google_compute_address.asia-vpn_static_ip.address
  target      = google_compute_vpn_gateway.eu-gateway.id
}

resource "google_compute_forwarding_rule" "eu-fr_udp4500" {
  project = "armageddon-eu"
  name        = "${module.infra-eu.name}-fr-udp4500"
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = google_compute_address.eu-vpn_static_ip.address
  target      = google_compute_vpn_gateway.asia-gateway.id
}

resource "google_compute_forwarding_rule" "asia-fr_udp4500" {
  project = "armageddon-as"
  name        = "${module.infra-asia.name}-fr-udp4500"
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = google_compute_address.asia-vpn_static_ip.address
  target      = google_compute_vpn_gateway.eu-gateway.id
}

resource "google_compute_vpn_tunnel" "eu-tunnel" {
  project = "armageddon-eu"
  name = "${module.infra-eu.name}-tunnel-1"
  peer_ip = google_compute_address.eu-vpn_static_ip.address
  shared_secret = "tu13DRaj7X8e8C0Ai6Qw"

  target_vpn_gateway = google_compute_vpn_gateway.asia-gateway.gateway_id
}

resource "google_compute_vpn_tunnel" "asia-tunnel" {
  project = "armageddon-as"
  name = "${module.infra-asia.name}-tunnel-1"
  peer_ip = google_compute_address.eu-vpn_static_ip.address
  shared_secret = "tu13DRaj7X8e8C0Ai6Qw"

  target_vpn_gateway = google_compute_vpn_gateway.eu-gateway.gateway_id
}

resource "google_compute_route" "eu-route" {
  project = "armageddon-eu"
  name = "${module.infra-eu.name}-${module.infra-asia.name}-route"
  network = module.infra-eu.name
  dest_range = module.infra-asia.subnet_cidr
  priority = 1000

  next_hop_vpn_tunnel = google_compute_vpn_tunnel.asia-tunnel.id
}

resource "google_compute_route" "asia-route" {
  project = "armageddon-as"
  name = "${module.infra-asia.name}-${module.infra-eu.name}-route"
  network = module.infra-asia.name
  dest_range = module.infra-eu.subnet_cidr
  priority = 1000

  next_hop_vpn_tunnel = google_compute_vpn_tunnel.eu-tunnel.id
}


# resource "google_compute_firewall" "eu-vpn-rules" {
#   project = "armageddon-eu"
#   name        = "vpn-rules"
#   network     = module.infra-eu.vpc
#   description = "Firewall rules to open SSH"

#   allow {
#     protocol = "udp"
#     ports    = ["500","4500"]
#   }

#   source_ranges = ["0.0.0.0/0"]

#   # source_tags = []

# }

# resource "google_compute_firewall" "asia-vpn-rules" {
#   project = "armageddon-as"
#   name        = "vpn-rules"
#   network     = module.infra-asia.vpc
#   description = "Firewall rules to open SSH"

#   allow {
#     protocol = "udp"
#     ports    = ["500","4500"]
#   }

#   source_ranges = ["0.0.0.0/0"]

#   # source_tags = []

# }

# resource "google_compute_firewall" "eu-esp-vpn-rules" {
#   project = "armageddon-eu"
#   name        = "esp-vpn-rules"
#   network     = module.infra-eu.vpc
#   description = "Firewall rules to open SSH"

#   allow {
#     protocol = "esp"
#   }

#   source_ranges = ["0.0.0.0/0"]

#   # source_tags = []

# }

# resource "google_compute_firewall" "asia-esp-vpn-rules" {
#   project = "armageddon-as"
#   name        = "esp-vpn-rules"
#   network     = module.infra-asia.vpc
#   description = "Firewall rules to open SSH"

#   allow {
#     protocol = "esp"
#   }

#   source_ranges = ["0.0.0.0/0"]

#   # source_tags = []

# }