#!/bin/bash
echo "Setting up tmux...";

echo "Installing catppuccin theme"
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.3.0 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

echo "tmux configuration finished!"
