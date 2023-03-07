#!/bin/bash
source ~/.dotfiles/scripts/utils.sh
gitpull ~/.dotfiles

# gitconfig
if [[ ! -f ~/.gitconfig ]]; then
  create_dotfile .gitconfig git
fi

# zshrc.local
if [[ ! -f ~/.zshrc.local ]]; then
  create_dotfile .zshrc.local zshrc_local
fi

# zshrc
create_update_dotfile .zshrc zsh

# alias
create_update_dotfile .zshrc.alias alias

# vimrc
create_update_dotfile .vimrc vim

# tmux
create_update_dotfile .tmux.conf tmux

# tmux quick session
create_update_dotfile .tmux/dev.sh tmuxDev
create_update_dotfile .tmux/research.sh tmuxRes

echo; echo "Reloading Zsh... \n";
omz reload
