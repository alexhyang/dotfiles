#!/bin/bash
export DOTFILES="$HOME/.dotfiles"
source $DOTFILES/scripts/utils.sh

# local setup
create_unique_local_dotfile .gitconfig git
create_unique_local_dotfile .zshrc.local .zshrc.local

# universal setup
source $DOTFILES/scripts/set_up_command_line_tools.sh
source $DOTFILES/scripts/set_up_zsh.sh
source $DOTFILES/scripts/create_symlinks.sh
source $DOTFILES/scripts/set_up_vim.sh
source $DOTFILES/scripts/set_up_tmux.sh
source $DOTFILES/scripts/save_sysinfo.sh

echo "Automatic setups finished!"
echo "New Machine Configuration Finished!\n"
cat ~/sysinfo
echo "Reloading zsh..."
omz reload
