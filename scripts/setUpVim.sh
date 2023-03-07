#!/bin/bash
echo "Setting up Vim...";

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
then
    echo "Installing Vim package manager...";
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Pulling the latest Vundle updates";
    gitpull ~/.vim/bundle/Vundle.vim
fi

if [ ! -d "$HOME/.vim/pack/plugins/start/ctrlp" ]
then
    mkdir -p ~/.vim/pack/plugins/start
    git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp
    echo "Vim plugin ctrlp installed!";
fi

echo "Vim configuration finished!"
