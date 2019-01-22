data "google_dns_managed_zone" "stratushood-zone" {
    name = "stratushood-zone"
    project = "nomad-terraform"

}

resource "google_dns_record_set" "dns" {
  name = "my-address.${data.google_dns_managed_zone.stratushood-zone.dns_name}"
  type = "TXT"
  ttl  = 300
  managed_zone = "${data.google_dns_managed_zone.stratushood-zone.name}"
  rrdatas = ["test"]
}
