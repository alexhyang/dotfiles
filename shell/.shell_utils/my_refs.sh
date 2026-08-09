#!/usr/bin/env bash

q_refs() { # show help of specified command
  if [[ $# -eq 0 ]]; then
    echo "q_refs <command-to-search> [sub-command]"
    echo "cached quick refs:"
    ls -x /tmp/*.ch_results | sed "s/\/tmp\///g" | sed "s/\.ch_results//g"
    return 1
  fi

  if [[ ! -f "/tmp/$1.ch_results" ]]; then
    curl --silent "cheat.sh/$1" > "/tmp/$1.ch_results"
  fi

  local pattern="${2:-}"
  rg -B 1 -N "$2" "/tmp/$1.ch_results"
}


# List/open/create my personal terminal command helps
# if there is no argument, list available refs
# if ref name is given, open or create markdown file
# TODO: improve this function
my_refs() { # get help from my references
  createRef() {
    promptMsg="Create $1? [y/N]"
    if util_confirm "Create $1?"; then
      touch $1 && vi $1
    fi
  }

  refroot=~/vimwiki/notes
  cd $refroot

  if [[ $# -eq 0 && -d $refroot ]]; then
    # $ myrefs
    fd -e md | sort | less
  else
    if [[ $# -eq 1 ]]; then
      refname="$1"
    fi
    if [[ $# -eq 2 ]]; then
      flag="$1"
      refname="$2"
    fi

    refpath="$refname.md"
    if [[ -f $refpath ]]; then
      # if refname.md exists
      case $flag in
        -e)
          # $ myrefs -e xyz
          vi $refpath
          ;;
        -g)
          glow $refpath
          ;;
        *)
          # $ myrefs <any other flags> xyz
          bat $refpath
          ;;
      esac
    else
      # if refname.md does not exist
      case $flag in
        # -s)
        #   # $ myrefs -s xyz
        #   # search pattern in wiki/notes
        #   fd $refname -t f
        #   ;;
        *)
          fd $refname -t f
          echo "Requested ref doesn't exit!"
          createRef $refpath
          ;;
      esac
    fi
  fi
  popd > /dev/null
}
