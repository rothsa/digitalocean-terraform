resource "digitalocean_droplet" "puppet" {
    image = "ubuntu-16-04-x64"
    name = "puppet"
    region = "nyc3"
    size = "2Gb"
    resize_disk = "false"

  connection {
      user = "root"
      type = "ssh"
      private_key = "${file(var.private_key_path)}"
      timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
    # install salt-master
      "curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com",
      "sudo sh bootstrap-salt.sh git develop",
    ]
  }
}
