#!/bin/sh

if [ $1 ] && [ $2 ] ; then
  hostname=$1
  vmid=$2
  ip="10.32.14.$vmid/24"
  gw=10.32.14.254
  dns="10.32.14.254"

  qm clone 9999 $vmid --name $hostname
  qm resize $vmid scsi0 16G;
  qm set $vmid --ipconfig0 ip=$ip,gw=$gw --nameserver $dns
  qm set $vmid --sshkey ~/.ssh/cloud_init_rsa.pub
  qm set $vmid --ciuser=senio
  qm set $vmid --cipassword=a@123456
  qm start $vmid
else

  echo 'hostname=$1'
  echo 'vmid=$2'

fi

