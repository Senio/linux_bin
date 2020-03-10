#!/bin/sh

opkg update && opkg install ca-certificates zsh curl git-http

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sed -i "s/robbyrussell/agnoster/g" ~/.zshrc

# sed -i -- 's:/bin/ash:/usr/bin/zsh:g' /etc/passwd

