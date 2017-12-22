#!/bin/bash
#https://docs.docker.com/engine/installation/linux/docker-ce/debian/

apt-get update

apt-get -y install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get install docker-ce -y

## Install docker-compose
#https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-docker-compose-for-raspbian
#curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose
apt-get install docker-compose

docker-compose --version
