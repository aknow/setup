#!/bin/bash

cd
mkdir -p ~/bin

sudo apt-get update

# git, mercurial
sudo apt-get install -y git git-core mercurial rake curl tmux

# hub
git clone https://github.com/github/hub.git
cd hub
rake install prefix=/usr/local

# python, pyflakes, setuptools, pip
sudo apt-get install -y python pyflakes
curl https://bootstrap.pypa.io/get-pip.py | sudo python

# nvm, node
# https://github.com/creationix/nvm
#curl https://raw.github.com/creationix/nvm/master/install.sh | sh
#source $HOME/.nvm/nvm.sh
#nvm install v0.11.2
#nvm use v0.11.2

# jshint-gecko (customized jshint)
#curl https://raw.github.com/aknow/jshint-gecko/master/install.sh | bash

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
#sudo apt-get install -y rlwrap

# vim
~/setup/install-vim.sh

# dotfiles
cd
if [ -d ./dotfiles/ ]; then
  cd dotfiles
  git pull
  git checkout -f HEAD
  cd
else
  git clone git@github.com:aknow/dotfiles.git
fi

ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.gitconfig .
ln -sb dotfiles/.hgrc .
ln -sb dotfiles/.tmux.conf .


# ----------------------------------------
# GUI related.
# ----------------------------------------

# Monaco font
#MONACO_PATH=http://www.gringod.com/wp-upload/MONACO.TTF
#sudo curl ${MONACO_PATH} -sLo /usr/share/fonts/truetype/monaco.ttf
#sudo fc-cache -f -v

# Open command prompt here
sudo apt-get install -y nautilus-open-terminal
nautilus -q

# Gnome setting
sudo apt-get install -y gnome-tweak-tool compizconfig-settings-manager
