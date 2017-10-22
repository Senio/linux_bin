#!/bin/bash
#https://www.solaris-cookbook.eu/virtualisation/proxmox/proxmox-lxc-running-docker-inside-container/

lxc_path="/etc/pve/lxc/$1.conf"
echo $lxc_path

echo "#insert docker part below" >> $lxc_path
echo "lxc.aa_profile: unconfined" >> $lxc_path
echo "lxc.cgroup.devices.allow: a" >>$lxc_path
echo "lxc.cap.drop:" >> $lxc_path
