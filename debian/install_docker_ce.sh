#!/bin/bash
#https://docs.docker.com/engine/installation/linux/docker-ce/debian/

sudo apt-get update

sudo apt-get -y install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

#curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"
#add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
#   $(lsb_release -cs) \
#   stable"

sudo apt-get update

sudo apt-get install docker-ce -y

sudo usermod -a -G docker senio

## Install docker-compose
#https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-docker-compose-for-raspbian
#curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# sudo apt-get install docker-compose -y

# https://docs.docker.com/compose/install/#install-compose
sudo apt purge docker-compose -y
rm -f /usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version

