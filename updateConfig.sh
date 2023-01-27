#!/bin/bash

echo; echo "Copying git config files...";
cp ~/.dotfiles/config/.gitconfig ~/.gitconfig
echo "~/.gitconfig updated!"

echo "Copying zsh config files...";
cp ~/.dotfiles/config/.zshrc ~/.zshrc
echo "~/.zshrc updated!"

echo "Copying Vim config files...";
cp ~/.dotfiles/config/.vimrc ~/.vimrc
echo "~/.vimrc updated!"

echo "Copying tmux config files...";
cp ~/.dotfiles/config/.tmux.conf ~/.tmux.conf
echo "~/.tmux.conf updated!"
