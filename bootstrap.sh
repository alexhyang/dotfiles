#!/bin/bash

sudo apt install tree htop  # install more terminal packages
apt list --installed curl git zsh vim tmux tree htop 
## dpkg -l tree htop curl git zsh vim tmux
# curl -V, git version, zsh --version, vim --version
# tmux -V, nvm --version, node --version

echo; echo "Settings up zsh..."; source scripts/setUpZsh.sh
echo; echo "Settings up vim..."; source scripts/setUpVim.sh
echo; echo "Settings up tmux..."; source scripts/setUpTmux.sh
echo; echo "Copying config files..."; source updateConfig.sh
echo; echo "Now install Vim plugins in editor..."; source scripts/setUpVimTheme.sh
echo; echo "Saving system information..."; source scripts/saveSysInfo.sh

cd ~
echo "Automatic setups finished!"
echo "New Machine Configuration Finished!"
cat sysinfo
