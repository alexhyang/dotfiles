#!/usr/bin/env bash
export DOTFILES="$HOME/.dotfiles"
source $DOTFILES/bootstrap/utils.sh

# universal setup
source $DOTFILES/bootstrap/set_up_command_line_tools.sh
stow shell bash zsh-omz vim tmux proj-common
source $DOTFILES/bootstrap/set_up_tmux.sh
source $DOTFILES/bootstrap/set_up_vim.sh
fastfetch
