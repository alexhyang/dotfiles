#!/bin/bash
echo "Linking dotfiles...;"
CONFIG="$HOME/.dotfiles/config"

# shell
# -s creates a soft link
# -f replaces existing link if there's any
ln -s $CONFIG/.aliases ~/.aliases
ln -s $CONFIG/.shell_utils ~/.shell_utils
ln -s $CONFIG/.p10k.zsh.omz ~/.p10k.zsh.omz

ln -sf $CONFIG/.bashrc ~/.bashrc
ln -s $CONFIG/.bash_aliases ~/.bash_aliases

# workflow
ln -sf $CONFIG/.editorconfig ~/.editorconfig
ln -sf $CONFIG/.vimrc ~/.vimrc
ln -sf $CONFIG/.tmux.conf ~/.tmux.conf
ln -sfn $CONFIG/.tmux ~/.tmux

echo "dotflies linked successfully!"
