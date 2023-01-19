#!bin/sh
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
then
    echo; echo "Installing Vim package manager..."; sleep 1
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Pulling the latest Vundle updates"
    cd ~/.vim/bundle/Vundle.vim
    git pull
    cd ~/.dotfiles
fi

echo; echo "Copying Vim config files..."; sleep 1
cp config/.vimrc ~/.vimrc
echo "done!"
