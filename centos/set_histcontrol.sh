#!/bin/sh

grep 'export HISTCONTROL=ignoreboth' ~/.bashrc
if [ $? -ne 0 ] ; then
  echo 'export HISTCONTROL=ignoreboth' >> ~/.bashrc
fi

