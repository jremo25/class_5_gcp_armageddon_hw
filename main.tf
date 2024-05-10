module "prototype-eu" {
    source = "./modules/infra"
    providers = {
      google = google.armageddon-eu
    }
    project_name = var.project_name
    region = "europe-central2"
    zone = "europe-central2-a"
    subnet_cidr = "10.210.1.0/24"

}

module "infra-us-1" {
    source = "./modules/infra"
    providers = {
      google = google.armageddon-eu
    }
    project_name = "${var.project_name}-1"
    region = "europe-central2"
    zone = "europe-central2-a"
    subnet_cidr = "10.210.1.0/24"

}