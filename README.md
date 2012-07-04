# dotfiles

    cd ~

    ln -s dotfiles/.vim
    ln -s dotfiles/.vimrc
    ln -s dotfiles/.tmux.conf

    cd ~/dotfiles
    ./gitconfig.sh
    ./vimbundles.sh

    echo "source ~/dotfiles/.source" >> ~/.bashrc
