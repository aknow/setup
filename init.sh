#!/bin/bash

cd
mkdir -p ~/bin

# git, mercurial
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git git-core mercurial

# hub
curl http://defunkt.io/hub/standalone -sLo ~/bin/hub
chmod +x ~/bin/hub

# tmux
sudo apt-get install -y tmux

# python, pyflakes, setuptools, pip
sudo apt-get install -y python pyflakes
wget https://bitbucket.org/pypa/setuptools/raw/0.8/ez_setup.py -O - | sudo python
curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python

# nvm, node
# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
source $HOME/.nvm/nvm.sh
nvm install v0.11.2
nvm use v0.11.2

# jshint-gecko (customized jshint)
curl https://raw.github.com/aknow/jshint-gecko/master/install.sh | bash

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

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
MONACO_PATH=http://www.gringod.com/wp-upload/MONACO.TTF
sudo curl ${MONACO_PATH} -sLo /usr/share/fonts/truetype/monaco.ttf
sudo fc-cache -f -v

# Open command prompt here
sudo apt-get install -y nautilus-open-terminal
nautilus -q

# Gnome setting
sudo apt-get install -y gnome-tweak-tool compizconfig-settings-manager


# ----------------------------------------
# Notebook related.
# ----------------------------------------

# Disable touchpad
#sudo add-apt-repository -y ppa:atareao/atareao
#sudo apt-get update
#sudo apt-get install -y touchpad-indicator

