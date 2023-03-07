#!/bin/bash
export DOTFILES="$HOME/.dotfiles"

source $DOTFILES/scripts/setUpCLTs.sh
source $DOTFILES/scripts/utils.sh
source $DOTFILES/scripts/setUpZsh.sh
source $DOTFILES/scripts/setUpVim.sh
source $DOTFILES/scripts/setUpTmux.sh
source $DOTFILES/scripts/createSymLinks.sh
source $DOTFILES/scripts/setUpVimTheme.sh
source $DOTFILES/scripts/saveSysInfo.sh

echo "Automatic setups finished!"
echo "New Machine Configuration Finished!\n"
cat ~/sysinfo
