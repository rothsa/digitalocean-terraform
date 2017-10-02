# Create a new SSH key
resource "digitalocean_ssh_key" "do_key" {
    name = "do_key"
    public_key = "${file(var.public_key_path)}"

}
