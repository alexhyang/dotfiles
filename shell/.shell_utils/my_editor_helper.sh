#!/usr/bin/env bash

nvim_use() { # switch config files of nvim
  if [[ $1 == "" ]]; then
    echo "Please choose the nvim configuration you want to switch to"
    echo "1) lazy; 2) vanilla"
  fi

  case $1 in
    "lazy")
      echo "switching to lazyVim config..."
      if [[ $(pwd) == "~/.dotfiles" ]]; then
        pushd
      else 
        cd ~/.dotfiles
      fi

      stow -D nvim*
      stow nvim-lazyvim
      popd
      ;;
    "vanilla")
      echo "switching to vanillaVim config..."
      if [[ $(pwd) == "~/.dotfiles" ]]; then
        pushd
      else 
        cd ~/.dotfiles
      fi

      stow -D nvim*
      stow nvim-lazyvim
      popd
      ;;
    *)
      echo "use \"lazy\" or \"vanilla\" as argument"
      ;;
  esac
}

