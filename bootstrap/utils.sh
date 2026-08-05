#!/bin/bash
# This file provides utilities for bootstrap.sh

gitpull() {
  if [[ $(pwd) == $1 ]]; then
    git pull
  else
    pushd $1
    git pull
    popd
  fi
}

copy_dotfile() {
  echo "copying $1 to \$HOME/ ..."
  cp -iv ~/.dotfiles/config/$1 ~/$1
}

backcopy_dotfile () {
  # overwrite remote config with local config
  echo "~/.dotfiles/config/$1 updated!\n"
  cp -iv ~/$1 ~/.dotfiles/config/$1
}
