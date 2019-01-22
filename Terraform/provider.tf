provider "google" {
  credentials = "${var.credentials}"
  project     = "${var.project}"
  region      = "${var.region}"
}
variable "credentials" {}
variable "project" {}
variable "region" {}



