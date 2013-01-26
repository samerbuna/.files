#!/usr/bin/env bash

GENERAL_INSTALLS=true

################# APT

if [[ "$GENERAL_INSTALLS" = "true" ]]; then
  echo "apt..."
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get autoremove -y
  sudo apt-get autoclean -y
  sudo apt-get install -y autoconf automake build-essential curl exuberant-ctags g++ git iproute libreadline-dev libreadline6 libreadline6-dev ncurses-dev openssl pkg-config portmap rlwrap tmux vim whois nodejs npm
fi

################# RVM/RUBY

echo "rvm..."
if [[ ! -d $HOME/.rvm ]]; then
  curl -L get.rvm.io | bash -s stable
else
  rvm get stable
fi

################# .files/GIT

echo ".files..."
if [[ ! -d $HOME/.files ]]; then
  git clone https://github.com/samerbuna/.files.git $HOME/.files
else
  cd $HOME/.files && git pull --rebase
fi

cd $HOME

echo "Linking dotfile..."
ln -fs .files/.gemrc
ln -fs .files/.tmux.conf
ln -fs .files/.vim
ln -fs .files/.vimrc

echo "vim bundles..."
sh $HOME/.files/vimbundles.sh

echo "Git config..."
sh $HOME/.files/gitconfig.sh

echo "Done."
