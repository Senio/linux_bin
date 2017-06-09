#!/bin/bash

yum install yum-cron -y

sed -i 's|^update_messages = no|update_messages = yes|' /etc/yum/yum-cron.conf
sed -i 's|^download_updates = no|download_updates = yes|' /etc/yum/yum-cron.conf
sed -i 's|^apply_updates = no|apply_updates = yes|' /etc/yum/yum-cron.conf
sed -i 's|^emit_via = stdio|emit_via = email|' /etc/yum/yum-cron.conf
sed -i "s|^email_to = root|email_to = your@email.com|" /etc/yum/yum-cron-hourly.conf
sed -i 's|^update_cmd = default|update_cmd = security|' /etc/yum/yum-cron-hourly.conf
sed -i 's|^update_messages = no|update_messages = yes|' /etc/yum/yum-cron-hourly.conf
sed -i 's|^emit_via = stdio|emit_via = email|' /etc/yum/yum-cron-hourly.conf

systemctl enable yum-cron.service
systemctl restart yum-cron.service
