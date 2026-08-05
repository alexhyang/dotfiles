#!/bin/bash
source "$HOME/.tmux/aliases_utils.sh"

alias tls="tmux ls"
alias ta="tmux attach-session"
alias tca="tmux_create_attach"
alias tkl="tmux_kill_list"
alias tll="tmux_list_layouts"

alias ta0="tca 0"
alias tk0="tkl 0"
alias tka="tmux kill-session -a"
