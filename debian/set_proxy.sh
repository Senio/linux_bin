#!/bin/sh

git config --global http.proxy http://proxy:3128

echo 'Acquire::http::Proxy "http://proxy:3128/";' | sudo tee /etc/apt/apt.conf.d/proxy.conf
echo 'Acquire::https::Proxy "http://proxy:3128/";' | sudo tee -a /etc/apt/apt.conf.d/proxy.conf

sudo mkdir /etc/systemd/system/docker.service.d
grep http://proxy:3128 /etc/systemd/system/docker.service.d/http-proxy.conf
if [ $? -ne 0 ] ; then
  echo '[Service]' | sudo tee /etc/systemd/system/docker.service.d/http-proxy.conf
  echo 'Environment="HTTP_PROXY=http://proxy:3128"' | sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf
  echo 'Environment="HTTPS_PROXY=http://proxy:3128"' | sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf

  sudo systemctl daemon-reload
  sudo systemctl restart docker
fi



