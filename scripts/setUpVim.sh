#!/bin/bash
echo "Setting up Vim...";

# set up vim package manger: Vundle (replaced by vim-plug seen below)
# if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
# then
    # echo "Installing Vim package manager...";
    # git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# else
    # echo "Pulling the latest Vundle updates";
    # gitpull ~/.vim/bundle/Vundle.vim
# fi


# Set up vim package manager: vim-plug
echo "Copying plug.vim..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Set up ctrlp (fuzzy finder in vim)
if [ ! -d "$HOME/.vim/pack/plugins/start/ctrlp" ]
then
    mkdir -p ~/.vim/pack/plugins/start
    git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp
    echo "Vim plugin ctrlp installed!";
fi


# Install plugins in .vimrc
echo "Install plugins in Vim..."
if [ ! -d "$HOME/.vim/plugged/ale" ]
then
    echo "Last step: \nrun :PlugInstall" >>  temp.md
    vim temp.md
    rm temp.md
    echo "Vim plugins installed!";
fi

promptMessage="Install youcompleteme plugin? [y/N]: "
if [[ $SHELL == "/usr/bin/zsh" ]]; then
  read "confirm?$promptMessage"
else
  read -p $promptMessage confirm
fi
if [[ $confirm =~ ^[Yy]$ && -d "$HOME/.vim/plugged/youcompleteme" ]]; then
  sudo apt install cmake
  python3 ~/.vim/plugged/youcompleteme/install.py --ts-completer
fi


# Set up themes
if [[ -d "$HOME/.vim/plugged/vim-colors-solarized"  &&  ! -f "$HOME/.vim/colors/solarized.vim" ]]
then
    echo "Copying theme color file..."
    mkdir -p $HOME/.vim/colors/
    cp $HOME/.vim/plugged/vim-colors-solarized/colors/solarized.vim $HOME/.vim/colors/solarized.vim
    echo "solarized.vim theme configured!"
fi


echo "Vim configuration finished!"
