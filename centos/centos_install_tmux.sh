#!/bin/bash

yum install tmux -y

rpm -Uvh http://mirror.ghettoforge.org/distributions/gf/el/7/plus/x86_64//tmux-2.4-2.gf.el7.x86_64.rpm

git clone https://github.com/gpakosz/.tmux ~/.tmux
ln -s .tmux/.tmux.conf ~/
ln -s .tmux/.tmux.conf.local ~/
