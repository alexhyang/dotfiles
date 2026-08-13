#!/usr/bin/env bash

q_refs() { # show help of specified command
  if [[ $# -eq 0 ]]; then
    echo "q_refs <command-to-search> [sub-command]"
    echo "cached quick refs:"
    ls -x /tmp/*.ch_results | sed "s/\/tmp\///g" | sed "s/\.ch_results//g"
    return 1
  fi

  if [[ ! -f "/tmp/$1.ch_results" ]]; then
    curl --silent "cheat.sh/$1" >"/tmp/$1.ch_results"
  fi

  local pattern="${2:-}"
  rg -B 1 -N "$2" "/tmp/$1.ch_results"
}

refs() { # get help from my local references
  local refroot="$HOME/vimwiki/notes"
  local refname target
  local useglow=false
  local OPTIND=1 opt

  list_refs() {
    fd -e md | sort | less
  }

  show_refs() {
    refname="$1"
    target="$1.md"

    if [[ ! -f "$target" ]]; then
      fd "$refname" -t f
      return 1
    fi

    if $useglow; then
      glow -p $target
    else
      bat $target
    fi
  }

  # check
  if [[ ! -d "$refroot" ]]; then
    echo "$refroot doesn't exit. Aborting..."
    return 1
  fi

  while getopts ":e:gh" opt; do
    case "$opt" in
      e)
        vi "$refroot/$OPTARG.md"
        return 0
        ;;
      g)
        useglow=true
        ;;
      h)
        echo "Usage: refs [-e] [-g] [target]"
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
  shift $((OPTIND - 1))

  hop_in $refroot
  if [[ $# -eq 0 ]]; then
    list_refs
  else
    show_refs $1
  fi
  hop_out >/dev/null
  return 0
}
