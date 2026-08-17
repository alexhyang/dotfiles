#!/usr/bin/env bash

cp_formatter() { # coding project editor support
  cp ~/.dotfiles/config/.editorconfig ./.editorconfig
  cp ~/.dotfiles/config/.prettierrc.js ./.prettierrc.js
}

# Node
alias eslints="npx eslint . --ext .ts,.tsx"
alias eslintjs="npx eslint . --ext .js,.jsx"

nkg() { # JS/TS: view package.json file
  if [[ $# -eq 1 ]]; then
    bat "$1"/package.json
  else
    bat package.json
  fi
}

# Java
jrun() { # shortcut to compile and run a simple java snippet
  javac "$1".java
  java "$1"
}

# C
crun() { # shortcut to compile and run a simple c snippet
  gcc -std=gnu11 -g -o "$1" "$1".c
  ."$1.c"
}

