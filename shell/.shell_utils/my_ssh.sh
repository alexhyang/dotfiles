#!/usr/bin/env bash

alias sshcfg="vi ~/.ssh/config"

nopassphrase() { # activate ssh key (so you don't have to enter it every time)
  eval "$(ssh-agent -s)"
  if [[ $# -eq 1 ]]; then
    ssh-add "$HOME/.ssh/id_ed25519_$1"
  else
    ssh-add ~/.ssh/id_ed25519
  fi
  ssh-add -l
}
