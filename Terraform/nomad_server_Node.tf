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
    provisioner "chef" {
    environment     = "_default"
    run_list        = ["cookbook::recipe"]
    node_name       = "nomad-server-node"
    secret_key      = "${file("../../ChefKeys/stratushook.pem")}"
    server_url      = "http://chef-server.stratushook.io/organizations/stratushook"
    recreate_client = true
    user_name       = "chefadmin"
    user_key        = "souse.assonant.vest.urolog"
    version         = "12.18.14"
    ssl_verify_mode = ":verify_none"
  }
}


resource "google_dns_record_set" "nomad-server-node-dns" {
  name = "nomad-server-node.stratushook.io."
  managed_zone = "stratushook-zone"
  type = "A"
  ttl  = 300

  rrdatas = ["${google_compute_instance.nomad-server-nodes.network_interface.0.access_config.0.nat_ip}"]
}

