#!/bin/bash

echo "deb http://httpredir.debian.org/debian stretch main" > /etc/apt/sources.list
echo "deb http://httpredir.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
echo "deb http://security.debian.org stretch/updates main" >> /etc/apt/sources.list

apt update && apt upgrade -y

apt install lsb-release -y
