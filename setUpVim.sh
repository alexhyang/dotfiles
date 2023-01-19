#!bin/sh
echo; echo "Installing Vim package manager..."; sleep 1
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo; echo "Copying tmux config files..."; sleep 1
cp config/.vimrc ~/.vimrc
