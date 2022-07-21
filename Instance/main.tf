resource "random_id" "instance_id" {
  byte_length = 4
}

# Configure the Google Cloud provider
provider "google" {
  credentials = file(var.credentials_file_path)
  project     = var.project_name
  region      = var.region
  zone        = var.region_zone
}

# Set up a backend to be proxied to:
# A single instance in a pool running nginx with port 80 open will allow end to end network testing
resource "google_compute_instance" "cluster1" {
  name         = "k8s-main${random_id.instance_id.hex}"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Ephemeral IP
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq nginx; sudo service nginx restart"
}

resource "google_compute_firewall" "cluster1" {
  name    = "armor-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}

