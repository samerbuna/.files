#!/usr/bin/env bash

GENERAL_INSTALLS=true

################# APT

if [[ "$GENERAL_INSTALLS" = "true" ]]; then
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get autoremove -y
  sudo apt-get autoclean -y
  sudo apt-get install ant apache2 apache2-prefork-dev autoconf automake bison build-essential curl exuberant-ctags g++ git imagemagick iproute libaio1 libapache2-mod-jk libapr1-dev libaprutil1-dev libc6-dev libcrypt-openssl-random-perl libcrypt-passwdmd5-perl libcurl4-openssl-dev libgfshare-bin libgfshare-dev libjmagick6-java libmysqlclient-dev libqt4-dev libreadline-dev libreadline6 libreadline6-dev libsqlite3-dev libssl-dev libstdc++5 libtool libxml2-dev libxslt-dev libyaml-dev makepasswd memcached mysql-client mysql-server ncurses-dev openjdk-6-jdk openjdk-6-jre-headless openssl pkg-config portmap postgresql redis-server rlwrap rsh-server sqlite3 tmux vim whois zlib1g zlib1g-dev
fi

################# RVM/RUBY

if [[ ! -d $HOME/.rvm ]]; then
  curl -L get.rvm.io | bash -s stable
  # rvm use --default ruby
else
  rvm install ruby
  rvm get stable --auto
fi

################# VIM

if [[ ! -d $HOME/.vim ]]; then
  git clone https://github.com/carlhuda/janus.git $HOME/.vim
else
  cd $HOME/.vim && git pull
fi

cd $HOME/.vim && rake

################# .files/GIT

if [[ ! -d $HOME/.files ]]; then
  git clone https://github.com/samerbuna/.files.git $HOME/.files
else
  cd $HOME/.files && git pull --rebase
fi

cd $HOME

echo "Linking dotfile"
ln -fs .files/.gemrc
ln -fs .files/.tmux.conf
ln -fs .files/.vimrc.before
ln -fs .files/.vimrc.after

sh $HOME/.files/gitconfig.sh

echo "Done.."
