resource "google_compute_instance" "nomad-server-nodes" {
  name = "nomad-server-node"
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


resource "google_dns_record_set" "nomad-server-node-dns" {
  name = "nomad-server-node.stratushook.io."
  managed_zone = "stratushook-zone"
  type = "A"
  ttl  = 300

  rrdatas = ["${google_compute_instance.nomad-server-nodes.network_interface.0.access_config.0.nat_ip}"]
}