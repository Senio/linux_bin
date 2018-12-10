#!/bin/bash

sh ./lxc_upgrade.sh
sh ./install_docker_ce.sh
sh ./install_tmux.sh
sh ./install_ohmyzsh.sh

apt install -y pydf
