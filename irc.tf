resource "digitalocean_droplet" "irc" {
    image = "ubuntu-16-04-x64"
    name = "irc"
    region = "sfo1"
    size = "512mb"
    ipv6 = "true"
    resize_disk = "false"

  connection {
      user = "root"
      host = "digitalocean_droplet.salt_master"
      type = "ssh"
      private_key = "files(var.private_key_path)"
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
