variable "do_token" {}
variable "public_key_path" {}
variable "private_key_path" {}
variable "ssh_fingerprint" {}

provider "digitalocean" {
  token = "${var.do_token}"
}
