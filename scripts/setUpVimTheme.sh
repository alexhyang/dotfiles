#!/bin/bash

echo "Last step: \nrun :PluginInstall" >>  temp.md
vim temp.md
rm temp.md
echo "Vim plugins installed!";

if [ -d "$HOME/.vim/bundle/vim-colors-solarized" ]
then
  echo "Copying Solarized color file..."
  if [ ! -d "$HOME/.vim/colors" ]
  then
    mkdir $HOME/.vim/colors/
  fi
  cd $HOME/.vim/
  cp ./bundle/vim-colors-solarized/colors/solarized.vim ./colors/solarized.vim
  cd ~/.dotfiles
  echo "solarized.vim copied!"
fi

