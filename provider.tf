terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.27.0"
    }
  }
}

provider "google" {
  # Configuration options
  # alias = "armageddon-eu"
  # zone = "us-central1-a"
  region = "us-central1"
  # project = "armageddon-eu"
  # credentials = "/home/ohbster/Cloud/GCP/auth/Armageddon/armageddon-eu-b30bce32da9f.json"
}

provider "google" {
  # Configuration options
  alias       = "armageddon-eu"
  zone        = "europe-central2-a"
  region      = "europe-central2"
  project     = "armageddon-eu"
  credentials = "/home/ohbster/Cloud/GCP/auth/Armageddon/armageddon-eu-b30bce32da9f.json"
}

provider "google" {
  # Configuration options
  alias       = "armageddon-us"
  zone        = "us-central1-a"
  region      = "us-central1"
  project     = "armageddon-us"
  credentials = "/home/ohbster/Cloud/GCP/auth/Armageddon/armageddon-us-b19dfc9280eb.json"
}

provider "google" {
  # Configuration options
  alias       = "armageddon-as"
  zone        = "us-central1-a"
  region      = "us-central1"
  project     = "armageddon-as"
  credentials = "/home/ohbster/Cloud/GCP/auth/Armageddon/armageddon-as-d13fd1afd9b6.json"
}