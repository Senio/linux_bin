#!/bin/bash

apt update && apt install kpartx

losetup /dev/loop0 image.img

kpartx -a /dev/loop0

vgchange -ay

pvscan
lvscan

mount /dev/sps/root /mnt/image
