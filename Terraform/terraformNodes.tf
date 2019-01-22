resource "google_compute_instance" "terraform-nodes" {
  name = "terraform-node"
  machine_type = "f1-micro"
  zone = "us-central1-a"
  count = 2
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20181222"
    }
  }

    metadata {
      exampleMeta = "This is example metadata"
    }
  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config = {
    }
  }
}