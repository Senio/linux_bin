#!/bin/bash

apt install tmux -y

git clone https://github.com/gpakosz/.tmux ~/.tmux
ln -s .tmux/.tmux.conf ~/
ln -s .tmux/.tmux.conf.local ~/
