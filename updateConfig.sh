#!/bin/bash

echo; echo "Copying git config files...";
cp config/.gitconfig ~/.gitconfig
echo "~/.gitconfig updated!"

echo "Copying zsh config files...";
cp config/.zshrc ~/.zshrc
echo "~/.zshrc updated!"

echo "Copying Vim config files...";
cp config/.vimrc ~/.vimrc
echo "~/.vimrc updated!"

echo "Copying tmux config files...";
cp config/.tmux.conf ~/.tmux.conf
echo "~/.tmux.conf updated!"
