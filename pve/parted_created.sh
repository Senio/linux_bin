#!/bin/bash

for i in a b c d e f
do
  echo $i
  parted -s /dev/sd$i mklabel loop
  parted -s /dev/sd$i mklabel gpt
  parted -s /dev/sd$i mkpart p1 0% 20%
  parted -s /dev/sd$i mkpart p2 20% 100%
done
