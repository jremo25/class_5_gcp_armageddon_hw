module "prototype-eu" {
  source = "./modules/infra"
  providers = {
    google = google.armageddon-eu
  }
  project_name = var.project_name
  region       = "europe-central2"
  zone         = "europe-central2-a"
  subnet_cidr  = "10.210.1.0/24"
  public_ip = false
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
  vpc_name = "us-1-vpc"
  region       = "us-central1"
  zone         = "us-central1-a"
  subnet_cidr  = "172.16.201.0/24"

}


module "infra-us-2" {
  source = "./modules/infra"
  providers = {
    google = google.armageddon-us
  }
  project_name = "armageddon-us"
  vpc_name = "us-2-vpc"
  region       = "us-west1"
  zone         = "us-west1-a"
  subnet_cidr  = "172.16.202.0/24"

}

module "infra-asia" {
  source = "./modules/infra"
  providers = {
    google = google.armageddon-as
  }
  project_name = "armageddon-as"
  region       = "asia-east1"
  zone         = "asia-east1-a"
  subnet_cidr  = "192.168.201.0/24"

}