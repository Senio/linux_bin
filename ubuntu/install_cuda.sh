#!/bin/sh

sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-get update
# sudo apt-get install cuda-9-0 cuda-9-2 -y
sudo apt-get -o Dpkg::Options::="--force-overwrite" install cuda-9-0 cuda-9-2 -y

# Install CUDA 9.2 on Ubuntu 18
# sudo apt-get -o Dpkg::Options::="--force-overwrite" install --fix-broken

# Install tensorflow-gpu
# sudo apt install python3-pip
# pip3 install tensorflow-gpu

