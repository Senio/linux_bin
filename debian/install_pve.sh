#!/bin/bash


pve_prereq() {
	EXTIF=$(ip route | grep default | rev | awk '{print $1}' | rev)
	ip=$(ifconfig $EXTIF | grep "inet " | awk '{print $2}')
	ip_host=$(hostname --ip-address)
	#echo $ip
	#echo $ip_host

	if [ "$ip" != "$ip_host" ] ; then
		echo 'hostname --ip-address check fail'
		prereq=1
	else
		echo 'PVE PreReq check Successfully'
		prereq=0
	fi
}

pve_prereq 

if [ $prereq = 0 ] ; then
	echo "deb http://download.proxmox.com/debian/pve stretch pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list

	wget http://download.proxmox.com/debian/proxmox-ve-release-5.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-5.x.gpg

	apt update && apt dist-upgrade -y

	apt install proxmox-ve postfix open-iscsi zfsutils-linux parted ksmtuned -y

	apt remove os-prober -y
	apt purge $(dpkg -l | grep linux-image | awk '{print $2}' | xargs) -y
	update-grub
fi

# modify /usr/share/pve-manager/js/pvemanagerlib.js
# if (data.status !== 'Active') {  >> if (false) {

