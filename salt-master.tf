resource "digitalocean_droplet" "salt-master" {
    image = ""
    name = "salt-master"
    region = "nyc3"
    size = "2gb"
    resize_disk = "false"
    ssh_keys = ["${digitalocean_ssh_key.do_key.id}"]
  
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
      "sudo sh bootstrap-salt.sh -M -N git develop",
    ]
  }
}
