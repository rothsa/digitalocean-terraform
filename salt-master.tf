resource "digitalocean_droplet" "salt_master" {
    image = "ubuntu-16-04-x64"
    name = "salt_master"
    region = "nyc3"
    size = "2gb"
    resize_disk = "false"
    ssh_keys = ["${digitalocean_ssh_key.rothsa_terraform_key.id}"]
  
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
      "sudo sh bootstrap-salt.sh -M -N git develop",
    ]
  }
}
