#!/usr/bin/env bash

weather_full() { # check current weather
  if [[ $1 == "" ]]; then
    curl -s wttr.in/YVR\?format=%l:+%x+%C+%t+%w+%S-%s
    echo ""
    curl -s wttr.in/YYZ\?format=%l:+%x+%C+%t+%w+%S-%s
    echo ""
    curl -s wttr.in/SEA\?format=%l:+%x+%C+%t+%w+%S-%s
    echo ""
    curl -s wttr.in/JFK\?format=%l:+%x+%C+%t+%w+%S-%s
    echo ""
  else
    curl -s wttr.in/$1\?format=%l:+%x+%C+%t+%w+%S-%s
    echo ""
  fi
}

# Usage
# if util_confirm "message"; then
#   echo "success"
# else
#   echo "failure"
# fi
util_confirm() { # receive user's confirmation on operation
  local promptMsg="${1:-Are you sure?} [y/N]: "
  local confirmation

  if [[ -n $ZHS_VERSION ]]; then
    read "confirmation?$promptMsg"
  else
    read -r -p "$promptMsg" confirmation
  fi

  case $confirmation in
    [Yy] | [Yy][Ee][Ss])
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}


