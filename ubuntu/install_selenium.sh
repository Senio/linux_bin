#!/bin/bash

sudo apt install -y chromium-browser default-jre

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo apt install -f

rm -f google-chrome-stable_current_amd64.deb

wget -c https://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip

unzip chromedriver_linux64.zip

sudo mv chromedriver /usr/local/bin

wget -c http://selenium-release.storage.googleapis.com/3.7/selenium-server-standalone-3.7.1.jar

#java -jar selenium-server-standalone-3.7.1.jar
