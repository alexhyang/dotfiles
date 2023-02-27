#!/bin/bash

DOTFILES="$HOME/.dotfiles"

# install more terminal packages
#   dir and files
#   text
#   processes
sudo apt update
sudo apt install \
tree fd-find locate autojump \
ripgrep \
htop

apt list --installed curl git zsh vim tmux \
tree fd-find locate autojump \
ripgrep \
htop

## dpkg -l tree htop curl git zsh vim tmux
# curl -V, git version, zsh --version, vim --version
# tmux -V, nvm --version, node --version

echo; echo "Settings up zsh..."; source $DOTFILES/scripts/setUpZsh.sh
echo; echo "Settings up vim..."; source $DOTFILES/scripts/setUpVim.sh
echo; echo "Settings up tmux..."; source $DOTFILES/scripts/setUpTmux.sh
echo; echo "Copying config files..."; source $DOTFILES/updateConfig.sh
echo; echo "Now install Vim plugins in editor..."; source $DOTFILES/scripts/setUpVimTheme.sh
echo; echo "Saving system information..."; source $DOTFILES/scripts/saveSysInfo.sh

cd ~
echo "Automatic setups finished!"
echo "New Machine Configuration Finished!\n"
cat sysinfo
