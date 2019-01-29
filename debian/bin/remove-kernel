#!/bin/bash

kernel_num=$1


if [ "$2" = "-y" ]; then
  dpkg --list | egrep -i --color "kernel-$kernel_num" | awk '{print $2}' | xargs apt --purge remove -y
else
  dpkg --list | egrep -i --color "kernel-$kernel_num"
fi
# dpkg --list | egrep -i --color 'kernel-4.13' | awk '{print $2}' | xargs apt --purge remove -y
