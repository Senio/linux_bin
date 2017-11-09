#!/bin/bash


sudo apt install -y chromium-browser

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo apt install -f

rm -f google-chrome-stable_current_amd64.deb

