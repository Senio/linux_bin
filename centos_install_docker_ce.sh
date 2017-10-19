#!/bin/bash
#https://docs.docker.com/compose/install/

yum remove docker \
  docker-common \
  container-selinux \
  docker-selinux \
  docker-engine -y

yum install -y yum-utils

yum-config-manager \
  --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo

yum makecache fast

yum install docker-ce -y

curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

systemctl start docker
systemctl enable docker
