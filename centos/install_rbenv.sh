#!/bin/bash

# https://gist.github.com/soardex/e95cdc230d1ac5b824b3

# install build dependencies
sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel

# clone and install rbenv environment
cd ~
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

# re-init bash
# source ~/.bash_profile
source ~/.zshrc

# install latest ruby
rbenv install -v 2.6.3

# sets the default ruby version that the shell will use
rbenv global 2.6.3

# to disable generating of documents as that would take so much time
echo "gem: --no-document" > ~/.gemrc

# install bundler
gem install bundler

# must be executed everytime a gem has been installed in order for the ruby executable to run
rbenv rehash

