!#/bin/sh
terraform import digitalocean_ssh_key.salt_key $salt_key_id
terraform import digitalocean_droplet.irc $irc_id
terraform import digitalocean_droplet.sysdig $sysdig_id
terraform import digitalocean_droplet.salt-master $salt_master_id
terraform import digitalocean_droplet.blueprint $blueprint_id
terraform import digitalocean_droplet.resume $resume_id
