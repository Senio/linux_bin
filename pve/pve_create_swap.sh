#!/bin/bash

zfs_pool_name="zfs_hdd_z2"

zfs create -V 64G -b $(getconf PAGESIZE) -o compression=zle \
  -o logbias=throughput -o sync=always \
  -o primarycache=metadata -o secondarycache=none \
  -o com.sun:auto-snapshot=false $zfs_pool_name/swap

ls /dev/zvol/$zfs_pool_name

mkswap -f /dev/zvol/$zfs_pool_name/swap

echo /dev/zvol/$zfs_pool_name/swap none swap defaults 0 0 >> /etc/fstab
