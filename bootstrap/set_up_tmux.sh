#!/bin/bash
echo "Setting up tmux...";

echo "Installing catppuccin theme"
mkdir -p ~/.config/tmux/plugins/catppuccin
if [[ ! -d ~/.config/tmux/plugins/catppuccin/tmux ]]; then
  git clone -b v2.3.0 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
fi

# integrate show live pomo timer in status bar
# install pomo with: `go install github.com/Bahaaio/pomo@latest`

POMO_CONFIG_ROOT="$HOME/.config/pomo"
mkdir -p $POMO_CONFIG_ROOT
ln -snf $HOME/.dotfiles/tmux/dot-tmux/pomo.yaml $POMO_CONFIG_ROOT/pomo.yaml

echo "tmux configuration finished!"
