#!/usr/bin/env bash

# Directory helpers
tmp() { # cd: create $HOME/tmp if it doesn't exist, then cd to $HOME/tmp
  mkdir -p $HOME/tmp && cd $HOME/tmp
}

cur_dirname() { # get current folder name
  basename $(pwd)
}

hop_in()  { # cache directory for a subsequent hop_out
  echo $(pwd) > /tmp/hop_from
  cd $1
}

hop_out() { # popd only when hop_in from a different dir
  if [[ "$(pwd)" != "$(cat /tmp/hop_from)" ]]; then
    popd
  fi
}

# File helpers
set_dst() { # mark the full path to the current directory for later use
  echo $(pwd) > ~/.mvDst
  echo "set destination to $(get_dst)"
}

get_dst() { # get the full path of the marked directory
  cat ~/.mvDst
}

go_dst() { # go to the marked directory
  cd $(get_dst)
}

mv_to_dst() { # move file(s) to the marked directory
  mv $1 "$(eval get_dst)"
  echo "$1 moved to $(get_dst)"
}

cp_to_dst() { # copy file(s) to the marked directory
  cp $1 "$(eval get_dst)"
  echo "$1 copied to $(get_dst)"
}

# File Operations
add_suffix() { # add suffix to the filenames of regex result by pattern
  if [[ $# -eq 0 ]]; then
    echo "useage: addSuffix <suffix> <pattern>"
  else
    suffix="$1"
    pattern="$2"

    echo "adding suffix: $suffix"
    rename -n "s/(.*)\.(.*)/\1-$suffix\.\2/" *$pattern*
    if util_confirm "Confirm rename?"; then
      rename "s/(.*)\.(.*)/\1-$suffix\.\2/" *$pattern*
    else
      echo "rename cancelled"
    fi
  fi
}

add_prefix() { # add prefix to the filenames of regex result by pattern
  if [[ $# -eq 0 ]]; then
    echo "useage: addPrefix <prefix> <pattern>"
  else
    prefix="$1"
    pattern="$2"

    echo "adding prefix: $prefix"
    rename -n "s/(.*)\.(.*)/$prefix-\1\.\2/" *$pattern*
    if util_confirm "Confirm rename?"; then
      rename "s/(.*)\.(.*)/$prefix-\1\.\2/" *$pattern*
    else
      echo "rename cancelled"
    fi
  fi
}

