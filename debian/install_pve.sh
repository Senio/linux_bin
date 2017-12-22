#!/bin/bash

echo "deb http://download.proxmox.com/debian/pve stretch pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list

wget http://download.proxmox.com/debian/proxmox-ve-release-5.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-5.x.gpg

apt update && apt dist-upgrade -y

apt install proxmox-ve postfix open-iscsi zfsutils-linux parted -y

apt remove os-prober

# modify /usr/share/pve-manager/js/pvemanagerlib.js
# if (data.status !== 'Active') {  >> if (false) {
