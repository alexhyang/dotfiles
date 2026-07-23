#!/bin/bash
echo "Setting up tmux...";

echo "Installing catppuccin theme"
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.3.0 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

# integrate show live pomo timer in status bar
# install pomo with: `go install github.com/Bahaaio/pomo@latest`

POMO_CONFIG_ROOT="$HOME/.config/pomo"
mkdir -p $POMO_CONFIG_ROOT
ln -snf $HOME/.dotfiles/config/.tmux/pomo.yaml $POMO_CONFIG_ROOT/pomo.yaml

echo "tmux configuration finished!"
