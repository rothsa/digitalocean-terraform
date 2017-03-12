resource "digitalocean_droplet" "combine" {
    image = "ubuntu-16-04-x64"
    name = "combine"
    count = "1"
    region = "nyc3"
    size = "2gb"
    resize_disk = "false"
    ssh_keys = ["${digitalocean_ssh_key.salt_key.id}"]

  connection {
      user = "root"
      type = "ssh"
      key_file = "${file(var.private_key_path)}"
      timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install salt-master
      "curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com",
      "sudo sh bootstrap-salt.sh git develop",
      "echo \"master: ${var.salt_master}\" >> /etc/salt/minion;service salt-minion restart"
    ]
  }
}
