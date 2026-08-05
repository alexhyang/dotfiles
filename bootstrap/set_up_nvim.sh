#!/bin/bash

if [ -f /etc/os-release ]; then
    . /etc/os-release

    case "$ID" in
      fedora)
          ;;
      arch)
          ;;
      ubuntu|debian)
          sudo apt install gcc
          sudo snap install nvim --classic
          ;;
    esac
fi

# -n avoids creating a sub-folder inside the old target folder
ln -sfn $DOTFILES/config/nvim ~/.config/nvim
