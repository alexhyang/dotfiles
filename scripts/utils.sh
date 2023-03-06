gitpull () {
  if [[ $(pwd) = $1 ]]; then
    git pull
  else
    pushd $1
    git pull
    popd
  fi
}

create_dotconfig_file () {
  # create local config files
  echo; echo "Creating $2 config file...";
  cp ~/.dotfiles/config/$1 ~/$1
  echo "~/$1 created!"
}

update_dotconfig_file () {
  # overwrite local config with remote config
  if ! diff ~/$1 ~/.dotfiles/config/$1; then
    echo "~/.dotfiles/config/$1 --> ~/$1? [y/n]"
    read confirmation
    if [ $confirmation = 'y' ]; then
      cp ~/.dotfiles/config/$1 ~/$1
      echo "~/$1 updated!\n"
    else
      echo "overwrite ~/$1 cancelled"
    fi
  fi
}

backupdate_dotconfig_file () {
  # overwrite remote config with local config
  if ! diff ~/.dotfiles/config/$1 ~/$1 ; then
    echo "~/$1 --> ~/.dotfiles/config/$1? [y/n]"
    read confirmation
    if [ $confirmation = 'y' ]; then
      cp ~/$1 ~/.dotfiles/config/$1
      echo "~/.dotfiles/config/$1 updated!\n"
    else
      echo "overwrite ~/.dotfiles/config/$1 cancelled"
    fi
  fi
}

create_update_dotconfig () {
  if [ ! -e ~/$1 ]; then
    create_dotconfig_file $1 $2
  else
    update_dotconfig_file $1
  fi
}
