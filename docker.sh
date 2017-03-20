#!/bin/bash
sudo apt-get -y install linux-image-extra-`uname -r`
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo \"deb https://apt.dockerproject.org/repo ubuntu-trusty main\" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get -y update
sudo apt-get -y install docker-engine
sed -i 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/g' /etc/default/ufw
sudo ufw reload
sudo docker -d &
