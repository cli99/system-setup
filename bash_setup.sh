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

# set git pull default
git config pull.ff only

if [ -f ~/.local ]; then
    mkdir -p ~/.local/bin
fi

if [ -f ~/.config ]; then
    mkdir ~/.config
fi

# install diff-so-fancy
cd ~/.local
git clone https://github.com/so-fancy/diff-so-fancy.git

# install starship
curl -fsSL https://starship.rs/install.sh | bash -b ~/.local/bin
cp ~/.config/starship.toml ~/sys-setup/configs 

# install poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

# copy configs
cd /tmp
git clone https://github.com/cli99/sys-setup.git
cd sys-setup
cp configs/.bashrc ~
cp /configs/.bash_profile ~
cp configs/.aliases ~
cp configs/.env ~
cp configs/.gitconfig ~
cp configs/.tmux.conf ~
cp configs/starship.toml ~/.config
cp -r .tmuxpanes ~
