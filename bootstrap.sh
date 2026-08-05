#!/bin/bash
export DOTFILES="$HOME/.dotfiles"
source $DOTFILES/bootstrap/utils.sh

# universal setup
source $DOTFILES/scripts/set_up_command_line_tools.sh
stow shell bash zsh-omz vim tmux proj-common
source $DOTFILES/scripts/set_up_tmux.sh
source $DOTFILES/scripts/set_up_vim.sh
fastfetch
