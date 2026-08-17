#!/usr/bin/env bash

paths() { # ENV: show all current PATH's
  # echo $PATH | sed -E "s/:/\n/g"
  echo "$PATH" | tr -s ":" "\n" | awk '!seen[$0]++'
}

## Search aliases and installed packages using pattern
alias sals="alias | rg"                # usage: `sals tmux`
alias spkg="apt list --installed | rg" # usage: `spkg htop`

reload_shell() { # reload shell
  case "$(ps -p $$ -o comm=)" in
    "zsh")
      echo "reload zsh..."
      omz reload
      ;;
    "bash")
      echo "reload bash..."
      # shellcheck source=bash/.bashrc
      source ~/.bashrc
      ;;
    *)
      echo "implement shell reload first"
      ;;
  esac
}

list_shell_funcs() { # Util: show a list of all custom shell functions
  rg -. "^\w+\(\) \{" ~/.localrc ~/.shell_utils
}

# TODO: implement utils for .bash_history
alias hist="nv ~/.zsh_history"

hist_rm() { # remove command history that contains given pattern
  sed -i "/$1/d" ~/.zsh_history
}

hist_rg() { # show commands in zsh history
  rg "$1" ~/.zsh_history
}
