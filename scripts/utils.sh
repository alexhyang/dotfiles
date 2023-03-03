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
  # create_config_file filename filename_in_message
  echo; echo "Creating $2 config file...";
  cp ~/.dotfiles/config/$1 ~/$1
  echo "~/$1 created!"
}

update_dotconfig_file () {

  if ! diff ~/$1 ~/.dotfiles/config/$1; then
    cp ~/.dotfiles/config/$1 ~/$1
    echo "~/$1 updated!\n"
  fi
}

create_update_dotconfig () {
  if [ ! -e ~/$1 ]; then
    create_dotconfig_file $1 $2
  else
    update_dotconfig_file $1
  fi
}
