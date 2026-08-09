#!/usr/bin/env bash

alias lg="lazygit"
alias gh="git_help"
alias git_help="myrefs git"

alias gla="glola"
alias gs.="gss ."
alias glc="git log \
  --oneline --decorate \
  --pretty='%Cred%h%Creset - %Cgreen(%ad) %C(auto)%d%Creset %s %C(bold blue)<%an>%Creset' \
  --date=short"
alias gcmi="gcmsg 'init commit'"

gig() { # Git: view (gig) or edit (gig -e) .gitignore
  if [[ "$1" == "-e" ]]; then
    vim .gitignore
  else
    cat .gitignore
  fi
}

gaddp() { # stage files by pattern
  fd "$1" | git add
}
