#!/bin/sh

git config --global http.proxy http://proxy:3128

echo 'Acquire::http::Proxy "http://proxy:3128/";' | sudo tee /etc/apt/apt.conf.d/proxy.conf
echo 'Acquire::https::Proxy "http://proxy:3128/";' | sudo tee -a /etc/apt/apt.conf.d/proxy.conf

