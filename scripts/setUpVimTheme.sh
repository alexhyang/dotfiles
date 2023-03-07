#!/bin/bash
echo "Installing Vim plugins and themes..."

if [ ! -d "$HOME/.vim/bundle/ale" ]
then
    echo "Last step: \nrun :PluginInstall" >>  temp.md
    vim temp.md
    rm temp.md
    echo "Vim plugins installed!";
fi

if [ -d "$HOME/.vim/bundle/vim-colors-solarized" ]
then
    echo "Copying Solarized color file..."
    if [ ! -d "$HOME/.vim/colors" ]
    then
      mkdir $HOME/.vim/colors/
      cp $HOME/.vim/bundle/vim-colors-solarized/colors/solarized.vim $HOME/.vim/colors/solarized.vim
    fi
    echo "solarized.vim theme configured!"
fi

echo "Vim plugin and theme configuration finished!"
