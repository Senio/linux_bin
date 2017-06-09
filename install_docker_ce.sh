#!/bin/bash
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

systemctl start docker
systemctl enable docker
