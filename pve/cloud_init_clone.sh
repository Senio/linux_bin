#!/bin/sh

if [ $1 ] ; then
  vmid=$1
  hostname="rails"
  ip="10.32.14.$vmid/24"
  gw=10.32.14.254
  dns="10.32.14.254"

  qm clone 9999 $vmid --name $hostname
  qm resize $vmid virtio0 16G;
  qm set $vmid --ipconfig0 ip=$ip,gw=$gw --nameserver $dns
  qm set $vmid --sshkey ~/.ssh/authorized_keys
  qm set $vimd --ciuser=senio
  qm set $vimd --cipassword=a@123456
else

  echo 'vmid=$1'

fi

