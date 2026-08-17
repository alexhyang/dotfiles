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
alias gcg="git commit --message"
alias gci="gcg 'init commit'"
alias gfp="git fetch -p"

gig() { # Git: view (gig) or edit (gig -e) .gitignore
  while getopts ":eh" opt; do
    case "$opt" in
      e)
        vim .gitignore
        return 0
        ;;
      h)
        echo "Usage: gig [-e]"
        return 0
        ;;
      \?)
        echo "Unknown flag: -$OPTARG" >&2
        return 1
        ;;
      :)
        echo "Option -$OPTARG requires an argument" >&2
        return 1
        ;;
    esac
  done

  cat .gitignore
  return 0
}

gaddp() { # stage files by pattern
  fd "$1" | git add
}
