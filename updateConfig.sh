#!/bin/bash
source ~/.dotfiles/scripts/utils.sh
gitpull ~/.dotfiles

# gitconfig
if [[ ! -f ~/.gitconfig ]]; then
  create_dotconfig_file .gitconfig git
fi

# zshrc.local
if [[ ! -f ~/.zshrc.local ]]; then
  create_dotconfig_file .zshrc.local zshrc_local
fi

# zshrc
create_update_dotconfig .zshrc zsh

# alias
create_update_dotconfig .zshrc.alias alias

# vimrc
create_update_dotconfig .vimrc vim

# tmux
create_update_dotconfig .tmux.conf tmux

# tmux quick session
create_update_dotconfig .tmux/dev.sh tmuxDev
create_update_dotconfig .tmux/research.sh tmuxRes

echo; echo "Reloading Zsh... \n";
omz reload
