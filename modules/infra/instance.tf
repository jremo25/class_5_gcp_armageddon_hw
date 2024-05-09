# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "instance" {
  boot_disk {
    auto_delete = true
    device_name = "${var.project_name}-device"

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240415"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  description         = "Blank"
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-small"
  metadata = {
    startup-script = "#!/bin/bash\nsudo apt-get update\nDEBIAN_FRONTEND=noninteractive sudo apt-get upgrade -yq \n\n#install git\nsudo apt install git -y && \\\n\nsudo apt install -y nginx  && \\\nsudo cat <<EOF > /var/www/html/index.html\n<html><body>\n<h1>Hello, Class 5.5</h1>\n<br/>\nHostname: $(curl \"http://metadata.google.internal/computeMetadata/v1/instance/hostname\" -H \"Metadata-Flavor: Google\")\n<br/>\nInstance ID: $(curl \"http://metadata.google.internal/computeMetadata/v1/instance/id\" -H \"Metadata-Flavor: Google\")\n<br/>\nProject ID: $(curl \"http://metadata.google.internal/computeMetadata/v1/project/project-id\" -H \"Metadata-Flavor: Google\")\n<br/>\nZone ID: $(curl \"http://metadata.google.internal/computeMetadata/v1/instance/zone\" -H \"Metadata-Flavor: Google\")\n<br/>\n</body></html>\nEOF"
  }
  name         = "${var.project_name}-instance"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork = google_compute_subnetwork.subnet.id
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "TERMINATE"
    preemptible         = true
    provisioning_model  = "SPOT"
  }

  service_account {
    email  = "597342763827-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  zone = var.zone
}
