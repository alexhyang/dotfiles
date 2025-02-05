#!/bin/bash
echo "Linking dotfiles...;"
DOTFILES="$HOME/.dotfiles"

# shell
ln -s $DOTFILES/config/.aliases ~/.aliases
ln -s $DOTFILES/config/.shell_utils ~/.shell_utils

ln -sf $DOTFILES/config/.bashrc ~/.bashrc
ln -s $DOTFILES/config/.bash_aliases ~/.bash_aliases

ln -sf $DOTFILES/config/.zshrc ~/.zshrc
ln -s $DOTFILES/config/.p10k.zsh ~/.p10k.zsh

# Neovim
# -n avoids creating a sub-folder inside the old target folder
ln -sfn $DOTFILES/config/nvim ~/.config/nvim

# workflow
ln -s $DOTFILES/config/.vimrc ~/.vimrc
ln -s $DOTFILES/config/.tmux.conf ~/.tmux.conf
ln -sfn $DOTFILES/config/.tmux ~/.tmux

echo "dotflies linked successfully!"
echo "now copy .local_env to root folder"
