#!/bin/bash
echo "Linking dotfiles...;"
DOTFILES="$HOME/.dotfiles"

# shell
ln -s $DOTFILES/config/.aliases ~/.aliases
ln -s $DOTFILES/config/.shell_utils ~/.shell_utils
ln -sf $DOTFILES/config/.profile ~/.profile

ln -sf $DOTFILES/config/.bashrc ~/.bashrc
ln -s $DOTFILES/config/.bash_aliases ~/.bash_aliases

ln -sf $DOTFILES/config/.zshrc ~/.zshrc
ln -s $DOTFILES/config/.p10k.zsh ~/.p10k.zsh

# workflow
ln -s $DOTFILES/config/.vimrc ~/.vimrc
ln -s $DOTFILES/config/.tmux.conf ~/.tmux.conf
mkdir -p ~/.tmux
ln -s $DOTFILES/config/.tmux/dev.sh ~/.tmux/dev.sh
ln -s $DOTFILES/config/.tmux/research.sh ~/.tmux/research.sh

echo "dotflies linked successfully!"
