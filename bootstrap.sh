#!/bin/bash
export DOTFILES="$HOME/.dotfiles"
source $DOTFILES/scripts/utils.sh

# local setup
copy_dotfile .gitconfig
copy_dotfile .localrc

# universal setup
source $DOTFILES/scripts/link_dotfiles.sh
source $DOTFILES/scripts/set_up_command_line_tools.sh
source $DOTFILES/scripts/set_up_tmux.sh
source $DOTFILES/scripts/set_up_vim.sh
source $DOTFILES/scripts/save_sysinfo.sh

echo "Automatic setups finished!"
echo "New Machine Configuration Finished!\n"
cat ~/sysinfo
