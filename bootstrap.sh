#!/bin/bash
export DOTFILES="$HOME/.dotfiles"
source $DOTFILES/scripts/utils.sh

# local setup
create_unique_local_dotfile .gitconfig git
create_unique_local_dotfile .zshrc.local zshrc_local

# universal setup
source $DOTFILES/scripts/setUpCLTs.sh
source $DOTFILES/scripts/setUpZsh.sh
source $DOTFILES/scripts/setUpVim.sh
source $DOTFILES/scripts/setUpTmux.sh
source $DOTFILES/scripts/createSymLinks.sh
source $DOTFILES/scripts/setUpVimTheme.sh
source $DOTFILES/scripts/saveSysInfo.sh

echo "Automatic setups finished!"
echo "New Machine Configuration Finished!\n"
cat ~/sysinfo
echo "Reloading zsh..."; omz reload
