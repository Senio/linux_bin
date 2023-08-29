#!/bin/bash
#https://docs.docker.com/engine/install/debian/

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -a -G docker az-senio

#https://docs.docker.com/engine/installation/linux/docker-ce/debian/

# sudo apt-get update
#
# sudo apt-get -y install \
#      apt-transport-https \
#      ca-certificates \
#      curl \
#      gnupg2 \
#      software-properties-common
#
# #curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
# curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
#
# #sudo apt-key fingerprint 0EBFCD88
# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/debian \
#    $(lsb_release -cs) \
#    stable"
# #add-apt-repository \
# #   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
# #   $(lsb_release -cs) \
# #   stable"
#
# sudo apt-get update
#
# # sudo apt-get install docker-ce -y
# sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# sudo usermod -a -G docker az-senio

## Install docker-compose
#https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-docker-compose-for-raspbian
#curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# sudo apt-get install docker-compose -y

# https://docs.docker.com/compose/install/#install-compose
# sudo apt purge docker-compose -y
# rm -f /usr/local/bin/docker-compose
# sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
# docker-compose --version

