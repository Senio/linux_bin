#!/bin/bash
# https://docs.docker.com/engine/install/ubuntu/


# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

# 1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# 2. Add Docker’s official GPG key:
# curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"
#add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
#   $(lsb_release -cs) \
#   stable"

sudo apt-get update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io

sudo usermod -a -G docker senio

## Install docker-compose
#https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-docker-compose-for-raspbian
#curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# sudo apt-get install docker-compose -y

# https://docs.docker.com/compose/install/#install-compose
# sudo apt purge docker-compose -y
# sudo rm -f /usr/local/bin/docker-compose
# # sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
# # sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# # sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#
# sudo chmod +x /usr/local/bin/docker-compose
#
# docker-compose --version

