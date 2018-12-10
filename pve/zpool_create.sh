#!/bin/bash

zpool create -f -o ashift=12 zfs_hdd_z2 raidz2 /dev/sda1 /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1
zpool create -f -o ashift=12 zfs_hdd_z2_dedup raidz2 /dev/sda2 /dev/sdb2 /dev/sdc2 /dev/sdd2 /dev/sde2 /dev/sdf2

zfs set dedup=on zfs_hdd_z2_dedup
zfs set compression=lz4 zfs_hdd_z2_dedup
