#!/bin/bash
#https://www.solaris-cookbook.eu/virtualisation/proxmox/proxmox-lxc-running-docker-inside-container/

echo_to_file() {

  if [ -z "$1" ] ;then
    echo "No line"
  elif [ -z "$2" ] ; then
    echo "No file"
  else
    #check file exist?
    if [ ! -f $2 ]; then
      echo ''
      echo '   '$2' not found'
      echo ''
    else
      echo ''
      echo $lxc_path
      echo ''

      #echo $1 $2
      #shell="grep \"$1\" $2"
      #echo $shell
      #$shell
      grep "$1" $2
      #grep "linux" README.md
      if [ $? -ne 0 ]; then
        echo 'add "'$1'" to '$2
        echo "$1" >> $2
      fi
    fi
  fi

}

lxc_path="/etc/pve/lxc/$1.conf"

#echo_to_file "linux" README.md
echo_to_file "#insert docker part below" $lxc_path
echo_to_file "lxc.aa_profile: unconfined" $lxc_path
echo_to_file "lxc.cgroup.devices.allow: a" $lxc_path
echo_to_file "lxc.cap.drop:" $lxc_path
