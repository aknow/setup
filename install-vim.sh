#!/bin/bash

# https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
  libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
  libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial

sudo apt-get remove vim vim-runtime gvim
sudo apt-get remove vim-tiny vim-common

cd
hg clone https://code.google.com/p/vim/
#hg clone ssh://hg@bitbucket.org/aknow/vim

cd vim
./configure --with-features=huge \
  --enable-rubyinterp \
  --enable-pythoninterp \
  --enable-perlinterp \
  --enable-gui=gtk2 --enable-cscope --prefix=/usr

make VIMRUNTIMEDIR=/usr/share/vim/vim73
sudo make install

# Vim setting.
cd
git clone git@github.com:aknow/.vim.git
cd ~/.vim
./install-vimrc.sh
vim
./install-xml.sh
./config-vim-ycm.sh
