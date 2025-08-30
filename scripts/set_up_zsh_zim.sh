#!/bin/bash

echo "Zim setup starting..."

ln -sf $DOTFILES/config/.zshrc.zim ~/.zshrc
ln -sf $DOTFILES/config/.zimrc ~/.zimrc
ln -sf $DOTFILES/config/.zshenv ~/.zshenv
ln -sf $DOTFILES/config/.p10k.zsh.zim ~/.p10k.zsh

echo "Zim setup finished!"
