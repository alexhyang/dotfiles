#!/usr/bin/env bash

alias l="eza --icons"
alias lsa="eza -lah"
alias la="eza -lAh"
alias l.="eza -d .*"
alias ll="eza -lh"
alias ll.="eza -lh -d .*"
lt() {
  eza --tree -L ${1:-1} ${2:-.}
}
lta() {
  eza -a --tree -L ${1:-1} ${2:-.}
}
lt.() {
  eza -d .* --tree -L ${1:-1} ${2:-.}
}
