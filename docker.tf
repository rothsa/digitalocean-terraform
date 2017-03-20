resource "digitalocean_droplet" "docker" {
    image = "ubuntu-16-04-x64"
    name = "docker"
    region = "nyc3"
    size = "2gb"
    resize_disk = "false"
    ssh_keys = ["${digitalocean_ssh_key.salt_key.id}"]

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
      "echo \"master: ${var.salt_master}\" >> /etc/salt/minion;service salt-minion restart",
      "chmod +x /tmp/docker.sh",
      "/tmp/docker.sh",
    ]
  }
  
  provisioner "file" {
    source      = "docker.sh"
    destination = "/tmp/docker.sh"
  }
}
