#!/bin/bash

zfs_pool_name="zfs_hdd_z2_dedup"

zfs create $zfs_pool_name/cache

rsync -avx /var/cache/* /$zfs_pool_name/cache

rm -rf /var/cache

zfs set mountpoint=/var/cache $zfs_pool_name/cache
