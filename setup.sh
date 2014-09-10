#!/usr/bin/env bash

echo ".files..."
if [[ ! -d $HOME/.files ]]; then
  git clone https://github.com/Coding-House/.files.git $HOME/.files
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
