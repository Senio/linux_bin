#!/bin/bash

zfs_pool_name="zfs_hdd_z2_dedup"

zfs create $zfs_pool_name/tmp

rsync -avx /var/tmp/* /$zfs_pool_name/tmp

rm -rf /var/tmp

zfs set mountpoint=/var/tmp $zfs_pool_name/tmp
