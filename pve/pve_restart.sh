#!/bin/bash

systemctl restart pve-cluster.service

systemctl restart pvedaemon.service

systemctl restart pveproxy.service

systemctl restart corosync.service
