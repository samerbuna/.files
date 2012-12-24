#!/usr/bin/env bash

GENERAL_INSTALLS=true

################# APT

if [[ "$GENERAL_INSTALLS" = "true" ]]; then
  echo "apt..."
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get autoremove -y
  sudo apt-get autoclean -y
  sudo apt-get install -y apache2 apache2-prefork-dev autoconf automake bison build-essential curl exuberant-ctags g++ git imagemagick iproute libapache2-mod-jk libapr1-dev libaprutil1-dev libc6-dev libcrypt-openssl-random-perl libcrypt-passwdmd5-perl libcurl4-openssl-dev libreadline-dev libreadline6 libreadline6-dev libssl-dev libstdc++5 libtool libxml2-dev libxslt-dev libyaml-dev ncurses-dev openssl pkg-config portmap postgresql redis-server rlwrap rsh-server tmux vim whois zlib1g zlib1g-dev nodejs npm
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
