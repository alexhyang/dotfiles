#!/usr/bin/env bash
export DOTFILES="$HOME/.dotfiles"
source $DOTFILES/bootstrap/utils.sh

# universal setup
source $DOTFILES/bootstrap/set_up_command_line_tools.sh
source $DOTFILES/bootstrap/set_up_ln.sh
source $DOTFILES/bootstrap/set_up_tmux.sh
source $DOTFILES/bootstrap/set_up_vim.sh
fastfetch || neofetch
