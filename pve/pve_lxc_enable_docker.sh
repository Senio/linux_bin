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
    else
      #echo $1 $2
      #shell="grep \"$1\" $2"
      #echo $shell
      #$shell
      grep "$1" $2 > /dev/null 2>&1
      #grep "linux" README.md
      if [ $? -ne 0 ]; then
        #echo '    modify '$lxc_path
        echo '    add "'$1'" to '$2
        echo "$1" >> $2
      else
        echo '    already have '$1
      fi
    fi
  fi
}

check_file_exist() {
  if [ ! -f $1 ]; then
    echo ''
    echo '    '$1' not found'
    echo ''
    return 1
  else
    return 0
  fi
}

lxc_path="/etc/pve/lxc/$1.conf"
check_file_exist $lxc_path
#check_file_exist "./README.md"
if [ $? -eq 0 ]; then
  echo '    '$lxc_path' exist'
  #echo_to_file "linux" README.md
  echo_to_file "#insert docker part below" $lxc_path
  echo_to_file "lxc.aa_profile: unconfined" $lxc_path
  echo_to_file "lxc.cgroup.devices.allow: a" $lxc_path
  echo_to_file "lxc.cap.drop:" $lxc_path
  echo ''
fi
