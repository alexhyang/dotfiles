#!/bin/bash

git pull

if [[ ! -f ~/.gitconfig ]]
then
    echo; echo "Copying git config files...";
    cp ~/.dotfiles/config/.gitconfig ~/.gitconfig
    echo "~/.gitconfig updated!"
fi

if [[ ! -f ~/.zshrc.local ]]
then
    echo; echo "Copying zsh local config files...";
    cp ~/.dotfiles/config/.zshrc.local ~/.zshrc.local
    echo "~/.zshrc.local updated!"
fi

echo "Copying zsh config files...";
cp ~/.dotfiles/config/.zshrc ~/.zshrc
echo "~/.zshrc updated!"

echo "Copying Vim config files...";
cp ~/.dotfiles/config/.vimrc ~/.vimrc
echo "~/.vimrc updated!"

echo "Copying tmux config files...";
cp ~/.dotfiles/config/.tmux.conf ~/.tmux.conf
echo "~/.tmux.conf updated!"

echo "Copying tmux quicksession files...";
cp -a ~/.dotfiles/config/.tmux/. ~/.tmux/
echo "~/.tmux/ updated!"

echo; echo "Reloading Zsh... \n";
omz reload
