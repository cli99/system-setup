#!/bin/sh

# install vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install fasd
sudo add-apt-repository ppa:aacebedo/fasd
sudo apt-get update
sudo apt-get install fasd

# copy configs
cd /tmp
git clone https://github.com/cli99/sys-setup.git
cd sys-setup
cp configs/.bashrc ~/.bashrc
cp configs/.aliases ~/.aliases
cp configs/.env ~/.env
cp configs/.gitconfig ~/.gitconfig
cp configs/.tmux.conf ~/.tmux.conf

# install diff-so-fancy
mkdir ~/.local
cd ~/.local
git clone https://github.com/so-fancy/diff-so-fancy.git


# install poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
