#!/bin/bash

apt install zsh powerline -y

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

sed -i "s/robbyrussell/agnoster/g" ~/.zshrc

dpkg-reconfigure locales
