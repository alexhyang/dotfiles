#!bin/sh
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
then
    echo "Installing Vim package manager..."; sleep 1
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Pulling the latest Vundle updates"; sleep 1
    cd ~/.vim/bundle/Vundle.vim
    git pull
    cd ~/.dotfiles
fi

echo "Copying Vim config files..."; sleep 1
cp config/.vimrc ~/.vimrc
echo ".vimrc updated!"
echo "Vim configuration done!"
