data "google_dns_managed_zone" "stratushook" {
    name = "stratushook-zone"
    project = "nomad-terraform"
}