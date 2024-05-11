module "infra-eu" {
  source = "./modules/infra"
  providers = {
    google = google.armageddon-eu
  }
  project_name = var.project_name
  infra_name = "eu-infra"
  region       = "europe-central2"
  zone         = "europe-central2-a"
  subnet_cidr  = "10.210.1.0/24"
  public_ip    = false
  open_ports   = ["22", "3389", "80"]
  # Use some defaults for these:
  # User Data
  # OS version
  # Storage Size
  # Machine type
}

module "infra-us-1" {
  source = "./modules/infra"
  providers = {
    google = google.armageddon-us
  }
  project_name = "armageddon-us"
  infra_name   = "us-1-infra"
  region       = "us-central1"
  zone         = "us-central1-a"
  subnet_cidr  = "172.16.201.0/24"
  open_ports   = ["22", "80"]

}

module "infra-us-2" {
  source = "./modules/infra"
  providers = {
    google = google.armageddon-us
  }
  project_name = "armageddon-us"
  infra_name   = "us-2-infra"
  region       = "us-west1"
  zone         = "us-west1-a"
  subnet_cidr  = "172.16.202.0/24"
  open_ports   = ["22"]

}

module "infra-asia" {
  source = "./modules/infra"
  providers = {
    google = google.armageddon-as
  }
  project_name = "armageddon-as"
  infra_name = "asia-infra"
  region       = "asia-east1"
  zone         = "asia-east1-a"
  subnet_cidr  = "192.168.201.0/24"
  open_ports   = ["3389"]

}