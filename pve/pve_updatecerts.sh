#!/bin/sh

node=$(hostname | awk -F '.' '{print $1}')

echo $node

rm /etc/pve/pve-root-ca.pem
rm /etc/pve/priv/pve-root-ca.key
rm /etc/pve/nodes/$node/pve-ssl.pem
rm /etc/pve/nodes/$node/pve-ssl.key

pvecm updatecerts -f
