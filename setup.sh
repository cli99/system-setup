#!/bin/sh

# install vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# install zsh
sudo apt update
sudo apt upgrade
sudo apt-get install -y zsh


cd /tmp
git clone https://github.com/cli99/sys-setup.git
cd sys-setup

cp .zshrc_zinit ~/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

zsh
