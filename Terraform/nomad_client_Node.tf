resource "google_compute_instance" "nomad-client-nodes" {
  name = "nomad-client-node"
  machine_type = "g1-small"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-nomadserver"
    }
  }
    allow_stopping_for_update = true

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