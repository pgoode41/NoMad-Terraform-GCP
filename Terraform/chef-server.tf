resource "google_compute_instance" "chef_instance" {
  name         = "chef-server"
  machine_type = "f1-micro"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-chefserver"
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
