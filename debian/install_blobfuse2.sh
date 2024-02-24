#!/bin/bash

cat /etc/*-release
# curl -sSL -O https://packages.microsoft.com/config/<distribution>/<version>/packages-microsoft-prod.deb
curl -sSL -O https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb

sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install libfuse3-dev fuse3 -y

sudo apt-get install blobfuse2

sudo blobfuse2 twse ~/twse --config-file=./config.yaml
# blobfuse2 mount /data1 --config-file=/home/az-senio/config.yaml --container-name=twse --log-level=log_debug --log-file-path=./bobfuse2b.log
blobfuse2 mount /data1 --config-file=/data1/blobfuse2.yaml

# fstab
/<path_to_blobfuse2_mount.sh_file>/mount.sh   </path/to/desired/mountpoint>     fuse    defaults,_netdev 0 0

de99a61c-d660-44b4-96e7-74c799334e39
