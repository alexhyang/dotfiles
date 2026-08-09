#!/usr/bin/env bash

# View or create README file
readme() { # view or edit README.md
  if [[ -f "./README.md" ]]; then
    vi ./README.md
  else
    if util_confirm "README.md doesn't exit! Create README.md?"; then
      touch README.md && vi README.md
    fi
  fi
}


# Drop or publish files
drop_notes() { # move a file in the notes dropbox
  dropbox="$HOME/research-notes/dropbox"
  if [[ ! -f $dropbox/$1 ]]; then
    mv ./$1 $dropbox/$1
  else
    if ! diff $dropbox/$1 ./$1; then
      if util_confirm "./$1 --> $dropbox/$1?"; then
        mv ./$1 $dropbox/$1
      else
        echo "dropNotes canceled"
      fi
    else
      echo "No difference between $1 and $dropbox/$1. DropNotes canceled."
    fi
  fi
}
