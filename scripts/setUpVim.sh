#!/bin/bash

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
then
    echo "Installing Vim package manager...";
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Pulling the latest Vundle updates";
    cd ~/.vim/bundle/Vundle.vim
    git pull
    cd ~/.dotfiles
fi

echo "Vim configuration done!"