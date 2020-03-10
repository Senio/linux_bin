#!/bin/bash

opkg update && opkg install tmux

git clone https://github.com/gpakosz/.tmux ~/.tmux
ln -s .tmux/.tmux.conf ~/
ln -s .tmux/.tmux.conf.local ~/
