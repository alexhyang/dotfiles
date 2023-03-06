#!/bin/bash

DOTFILES="$HOME/.dotfiles"
pushd $(pwd)

# install more terminal packages
#   dir and files
#   text
#   processes
sudo apt update
sudo apt install \
tree fasd fd-find fzf autojump locate \
ack ripgrep \
htop

# bind 'fd' alias with 'fd-find', see https://github.com/sharkdp/fd#on-ubuntu
ln -s $(which fdfind) ~/.local/bin/fd

apt list --installed curl git zsh vim tmux \
tree fasd fd-find fzf autojump locate \
ack ripgrep \
htop

# install broot
if [ ! -f "/usr/local/bin/broot" ]
then
    curl -o broot -L https://dystroy.org/broot/download/x86_64-linux/broot
    sudo mv broot /usr/local/bin
    sudo chmod +x /usr/local/bin/broot
    broot
fi

## dpkg -l tree htop curl git zsh vim tmux
# curl -V, git version, zsh --version, vim --version
# tmux -V, nvm --version, node --version

echo; echo "Settings up zsh..."; source $DOTFILES/scripts/setUpZsh.sh
echo; echo "Settings up vim..."; source $DOTFILES/scripts/setUpVim.sh
echo; echo "Settings up tmux..."; source $DOTFILES/scripts/setUpTmux.sh
echo; echo "Creating config files..."; source $DOTFILES/updateConfig.sh
echo; echo "Now install Vim plugins in editor..."; source $DOTFILES/scripts/setUpVimTheme.sh
echo; echo "Saving system information..."; source $DOTFILES/scripts/saveSysInfo.sh

popd
echo "Automatic setups finished!"
echo "New Machine Configuration Finished!\n"
cat sysinfo
