#!/usr/bin/env bash

nvim_use() { # switch config files of nvim
  if [[ $1 == "" ]]; then
    echo "Please choose the nvim configuration you want to switch to"
    echo "1) lazy; 2) vanilla"
  fi

  case $1 in
    "lazy")
      echo "switching to lazyVim config..."
      hop_in ~/.dotfiles
      stow -D nvim*
      stow nvim-lazyvim
      hop_out
      ;;
    "vanilla")
      echo "switching to vanillaVim config..."
      hop_in ~/.dotfiles
      stow -D nvim*
      stow nvim-lazyvim
      hop_out
      ;;
    *)
      echo "use \"lazy\" or \"vanilla\" as argument"
      ;;
  esac
}

