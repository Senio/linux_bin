#!/bin/sh

vmid=$1
stor="zfs_z2"

# apt install cloud-init -y

# download the image
# wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img
# wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img

# create a new VM
# qm create 9000 --memory 2048 --net0 virtio,bridge=vmbr0
qm create $vmid --cpu cputype=host --sockets 2 --cores 4 --memory 8192 --net0 virtio,bridge=vmbr0

# import the downloaded disk to local-lvm storage
# qm importdisk 9000 bionic-server-cloudimg-amd64.img local-lvm
# qm importdisk $vmid "debian-10.1.5-20191015-openstack-amd64.qcow2" zfs_hdd_z2
# qm importdisk $vmid bionic-server-cloudimg-amd64.img $stor
qm importdisk $vmid CentOS-7-x86_64-GenericCloud.qcow2 $stor

# finally attach the new disk to the VM as scsi drive
# qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9000-disk-1
# qm set $vmid --virtio0 zfs_hdd_z2:vm-$vmid-disk-0 --ide2 zfs_hdd_z2:cloudinit --boot c --bootdisk virtio0 --serial0 socket
qm set $vmid --scsihw virtio-scsi-pci --scsi0 $stor:vm-$vmid-disk-0
qm set $vmid --ide2 $stor:cloudinit --boot c --bootdisk virtio0 --serial0 socket

# qm template $vmid

