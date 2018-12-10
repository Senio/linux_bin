#!/bin/bash

zfs_pool_name="zfs_hdd_z2_dedup"

zfs create $zfs_pool_name/log

rsync -avx /var/log/* /$zfs_pool_name/log

rm -rf /var/log

zfs set mountpoint=/var/log $zfs_pool_name/log
