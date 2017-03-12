# Create a new SSH key
resource "digitalocean_ssh_key" "salt_key" {
    name = "salt_key"
    public_key = "${file(var.public_key_path)}"

}
