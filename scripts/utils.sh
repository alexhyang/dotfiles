gitpull() {
  if [[ $(pwd) == $1 ]]; then
    git pull
  else
    pushd $1
    git pull
    popd
  fi
}

create_dotfile() {
  # create local config files
  echo
  echo "Creating $2 config file..."
  cp ~/.dotfiles/config/$1 ~/$1
  echo "~/$1 created!"
}

create_unique_local_dotfile() {
  if [[ ! -f ~/$1 ]]; then
    create_dotfile $1 $2
  fi
}

: <<'END'
update_dotfile () {
  # overwrite local config with remote config
  if ! diff ~/$1 ~/.dotfiles/config/$1; then
    promptMessage="~/.dotfiles/config/$1 --> ~/$1? [y/N]: "
    if [[ $SHELL == "/usr/bin/zsh" ]]; then
      read "confirm?$promptMessage"
    else
      read -p $promptMessage confirm
    fi
    if [[ $confirm =~ ^[Yy]$ ]]; then
      cp ~/.dotfiles/config/$1 ~/$1
      echo "~/$1 updated!\n"
    else
      echo "overwrite ~/$1 cancelled"
    fi
  fi
}

backupdate_dotfile () {
  # overwrite remote config with local config
  if ! diff ~/.dotfiles/config/$1 ~/$1 ; then

    promptMessage="~/$1 --> ~/.dotfiles/config/$1? [y/N]: "
    if [[ $SHELL == "/usr/bin/zsh" ]]; then
      read "confirm?$promptMessage"
    else
      read -p $promptMessage confirm
    fi
    if [[ $confirm =~ ^[Yy]$ ]]; then
      cp ~/$1 ~/.dotfiles/config/$1
      echo "~/.dotfiles/config/$1 updated!\n"
    else
      echo "overwrite ~/.dotfiles/config/$1 cancelled"
    fi
  fi
}

create_update_dotfile () {
  # update dotfile, if not exists, create one
  if [ ! -e ~/$1 ]; then
    create_dotfile $1 $2
  else
    update_dotfile $1
  fi
}
END
