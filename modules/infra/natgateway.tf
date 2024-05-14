# If the variable "public_ip" is set to true, 
#   then set the resource counts to 0, and don't build anything here
# else, build a NAT gateway so that the instance can access the web

resource "google_compute_router" "router"{
    count = var.public_ip ? 0 : 1
    name = "${var.infra_name}-nat-router"
    network = google_compute_network.vpc.id
}

resource "google_compute_router_nat" "nat" {
    count = var.public_ip ? 0 : 1
    name = "${var.infra_name}-nat"
    router = google_compute_router.router[0].name
    nat_ip_allocate_option = "AUTO_ONLY"
    source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

    log_config {
        enable = true
        filter = "ERRORS_ONLY"
    }
}