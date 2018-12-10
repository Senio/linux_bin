#!/bin/sh

apt install cloud-init -y

vmid="1001"

# download the image
wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img

# create a new VM
# qm create 9000 --memory 2048 --net0 virtio,bridge=vmbr0
qm create 9999 --cpu cputype=host --sockets 2 --cores 4 --memory 8192 --net0 virtio,bridge=vmbr0

# import the downloaded disk to local-lvm storage
# qm importdisk 9000 bionic-server-cloudimg-amd64.img local-lvm
qm importdisk 9999 bionic-server-cloudimg-amd64.img zfs_hdd_z2

# finally attach the new disk to the VM as scsi drive
# qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9000-disk-1
# qm set 9999 --virtio0 zfs_hdd_z2:vm-9999-disk-0 --ide2 zfs_hdd_z2:cloudinit --boot c --bootdisk virtio0 --serial0 socket
qm set 9999 --scsihw virtio-scsi-pci --scsi0 zfs_hdd_z2:vm-9999-disk-0
qm set 9999 --ide2 zfs_hdd_z2:cloudinit --boot c --bootdisk virtio0 --serial0 socket

qm template 9999
qm clone 9999 $vmid --name ubuntu1604-1
qm resize $vmid virtio0 16G;
qm set $vmid --ipconfig0 ip=10.32.14.162/24,gw=10.32.14.254 --nameserver '10.32.14.254'

qm set $vmid --sshkey ~/.ssh/authorized_keys
