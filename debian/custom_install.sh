#!/bin/bash

# sh ./lxc_upgrade.sh

sudo apt update
sudo apt install -y git

sh ./install_docker_ce.sh
sh ./install_tmux.sh
sh ./install_ohmyzsh.sh

sudo apt install -y pydf
