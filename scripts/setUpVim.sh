#!/bin/bash
echo "Setting up Vim...";

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
then
    echo "Installing Vim package manager...";
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Pulling the latest Vundle updates";
    gitpull ~/.vim/bundle/Vundle.vim
fi

if [ ! -d "$HOME/.vim/pack/plugins/start/ctrlp" ]
then
    mkdir -p ~/.vim/pack/plugins/start
    git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp
    echo "Vim plugin ctrlp installed!";
fi

if [ ! -d "$HOME/.vim/bundle/ale" ]
then
    echo "Last step: \nrun :PluginInstall" >>  temp.md
    vim temp.md
    rm temp.md
    echo "Vim plugins installed!";
fi

echo "Install youcompleteme plugin? [y/N]"
read confirmYouCompleteMe
if [[ $confirmYouCompleteMe = "y" && -d "$HOME/.vim/bundle/youcompleteme" ]]; then
  sudo apt install cmake
  python3 ~/.vim/bundle/youcompleteme/install.py --ts-completer
fi

if [[ -d "$HOME/.vim/bundle/vim-colors-solarized"  &&  ! -d "$HOME/.vim/colors" ]]
then
    echo "Copying Solarized color file..."
    mkdir $HOME/.vim/colors/
    cp $HOME/.vim/bundle/vim-colors-solarized/colors/solarized.vim $HOME/.vim/colors/solarized.vim
    echo "solarized.vim theme configured!"
fi

echo "Vim configuration finished!"
