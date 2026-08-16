#!/usr/bin/env bash

check_env_vars() { # scripts guard
  local env_var_name=$1
  case "$(ps -p $$ -o comm=)" in
  "zsh")
    if [[ ${(P)env_var_name} == "" ]]; then
      echo "add path for \$$1"
      return 1
    else
      return 0
    fi
    ;;
  "bash")
    if [[ "${!env_var_name}" == "" ]]; then
      echo "add path for \$$1"
      return 1
    else
      return 0
    fi
    ;;
  *)
    echo "shell not supported"
    ;;
  esac
}

check_env_vars VIM_WIKI_ROOT
check_env_vars OBS_ROOT


# Vimwiki
WEEKS_ROOT="$OBS_ROOT/Alex-weeks"
TODO_ROOT="$WEEKS_ROOT/.todo"

alias .v="cd $VIM_WIKI_ROOT"
alias ww="hop_in $VIM_WIKI_ROOT; vm index.md; hop_out > /dev/null"
alias .w="cd $WEEKS_ROOT"
wk() { # go to WEEKS_ROOT/ and open the lastest week note in (n)vim
  weeks
  vi $(realpath $(fd 2026- $WEEKS_ROOT | tail -n 1))
}

# Todo's
alias .t="cd $TODO_ROOT"
alias todo="todo.sh"
alias tdcfg="nv ~/.config/todo/config"
alias tde="vi $TODO_ROOT/todo.txt"
alias tded="vi $TODO_ROOT/done.txt"
alias tdpl="cat $TODO_ROOT/priorities.txt"

## add, change, complete todo's
alias tda="todo add"
alias tdd="todo done"
alias tdpa="todo pri"
alias tdpr="todo depri"
tdaQ() { # short cut to add Linux tooling task
  tda "(Q) $1"
}

## report
alias td_report="echo 'time open done'; bat $TODO_ROOT/report.txt"

## list and query
alias tdls="tdls_query_pri A-Q" # ignore all after (R) to display a shorter list
alias tdls_pri="tdls_query_pri"
tdls_query_pri() { # filter todo's by priority, "(A-C)" by default
  clear
  todo ls | rg "\([${1:-A-Z}]"
}

