#!/bin/bash
echo "Setting up Vim...";

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
vim +PlugInstall +qall

# Set up themes
echo "Copying theme color file..."
mkdir -p $HOME/.vim/colors/
cp -iv $HOME/.vim/plugged/vim-colors-solarized/colors/* $HOME/.vim/colors
cp -iv $HOME/.vim/plugged/catppuccin/colors/* $HOME/.vim/colors

# Set up youcompleteme
promptMessage="Install youcompleteme plugin? [y/N]: "
if [[ $SHELL == "/usr/bin/zsh" ]]; then
  read "confirm?$promptMessage"
fi
if [[ $SHELL == "/bin/bash" || $SHELL == "/usr/bin/bash" ]]; then
  read -p "$promptMessage" confirm
fi

if [[ $confirm =~ ^[Yy]$ && -d "$HOME/.vim/plugged/youcompleteme" ]]; then
  sudo apt install build-essential cmake python3-dev
  python3 ~/.vim/plugged/youcompleteme/install.py --ts-completer
fi

echo "Vim configuration finished!"
