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
  local wikiroot="$HOME/vimwiki"
  local subfolder="refs"
  local ref_root ref_basename ref_fullname
  local edit=false
  local useglow=false
  local OPTIND=1 opt

  list_refs() {
    fd -e md | sort | less
  }

  show_refs() {
    ref_basename="$1"
    ref_fullname="$1.md"

    if [[ ! -f "$ref_fullname" ]]; then
      echo "Ref '$ref_fullname' doesn't exist..."
      echo "Create the ref with 'refs -e $ref_basename'"
      fd "$ref_basename" -t f
      return 1
    fi

    if $useglow; then
      glow -p $ref_fullname
    else
      bat $ref_fullname
    fi
  }

  while getopts ":e:d:gh" opt; do
    case "$opt" in
      e)
        edit=true
        ref_basename="$OPTARG"
        ;;
      g) useglow=true ;;
      d) subfolder="$OPTARG" ;;
      h)
        echo "Usage: refs [-e] [-g] [-d ref_subfolder_name] [refname]"
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

  ref_root="$wikiroot/$subfolder"

  # check
  if [[ ! -d "$ref_root" ]]; then
    echo "$ref_root doesn't exit. Aborting..."
    return 1
  fi

  hop_in $ref_root
  if $edit; then
    ref_fullname="$ref_basename.md"
    vi "$ref_root/$ref_fullname"
    return 0
  fi

  if [[ $# -eq 0 ]]; then
    list_refs
  else
    show_refs $1
  fi
  hop_out >/dev/null
  return 0
}

alias refn="refs -d notes"
alias refr="refs -d research"
