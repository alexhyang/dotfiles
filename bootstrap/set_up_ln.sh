#!/usr/bin/env bash
touch ~/.localrc
mv ~/.bashrc ~/.bashrc.bak
stow shell bash zsh-omz vim tmux proj-common
