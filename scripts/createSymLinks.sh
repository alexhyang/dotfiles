#!/bin/bash
echo "Linking dotfiles...;"

ln -s $DOTFILES/config/.zshrc ~/.zshrc
ln -s $DOTFILES/config/.p10k.zsh ~/.p10k.zsh
ln -s $DOTFILES/config/.zshrc.alias ~/.zshrc.alias
ln -s $DOTFILES/config/.vimrc ~/.vimrc
ln -s $DOTFILES/config/.tmux.conf ~/.tmux.conf
mkdir -p ~/.tmux
ln -s $DOTFILES/config/.tmux/dev.sh ~/.tmux/dev.sh
ln -s $DOTFILES/config/.tmux/research.sh ~/.tmux/research.sh

echo "dotflies linked successfully!"
