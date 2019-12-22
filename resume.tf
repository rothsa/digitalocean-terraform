resource "digitalocean_droplet" "resume" {
    image = "ubuntu-14-04-x64"
    name = "resume"
    region = "nyc3"
    size = "512mb"
    resize_disk = "false"

  connection {
      user = "root"
      host = "digitalocean_droplet.salt_master"
      type = "ssh"
      private_key = "file(var.private_key_path)"
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
