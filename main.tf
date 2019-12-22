# Create a new SSH key
resource "digitalocean_ssh_key" "rothsa_terraform_key" {
    name = "rothsa_terraform_key"
    public_key = "file(var.public_key_path)"

}
