#!/usr/bin/env bash

alias wkcfg="vi ~/.wakatime.cfg"
enable_waka() { # include current git repo in waka stats
  local promptMsg="${1:-What do you want to call this project?}: "
  local user_input

  case "$(ps -p $$ -o comm=)" in
    "zsh")
      read "user_input?$promptMsg"
      ;;
    "bash")
      read -p "$promptMsg" user_input
      ;;
    *)
      echo "shell not supported"
      ;;
  esac

  echo "[settings]\n\ninclude = .*" > .wakatime
  echo ".wakatime created"
  if [[ $user_input != "" ]]; then
    local project_name="${user_input:-}"
    echo $project_name > .wakatime-project
    echo ".wakatime-project created"
  fi
}
