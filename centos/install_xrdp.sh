#!/bin/bash

sudo dnf groupinstall "Server with GUI"

sudo dnf install epel-release

yum install -y tigervnc-server xrdp

sudo systemctl enable xrdp --now

# sudo systemctl status xrdp

vncpasswd AzureUser
passwd AzureUser

