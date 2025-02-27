#!/bin/sh

cd /etc/yum.repos.d/
sudo wget -c https://raw.githubusercontent.com/Senio/linux_bin/master/rocky/yum.repos.d/epel.repo
sudo wget -c https://raw.githubusercontent.com/Senio/linux_bin/master/rocky/yum.repos.d/rocky.repo
sudo dnf install openconnect git tmux -y
git clone https://github.com/gpakosz/.tmux ~/.tmux
ln -s ~/.tmux/.tmux.conf ~/
ln -s ~/.tmux/.tmux.conf.local ~/
sudo rm -f /etc/yum.repos.d/rocky.repo
sudo rm -f /etc/yum.repos.d/epel.repo
git clone https://gitlab.com/Senio1/opencon_helpme.git

