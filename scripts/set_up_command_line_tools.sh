#!/bin/bash
echo "Setting up Command Line Tools..."

# install man page for debian
machine=$(cat /etc/os-release | grep -E "^NAME=\".*\"" | sed -E 's/^.*?"(\w+)(\s?).*"$/\1/')
if [[ $machine == "Debian" ]]; then
  sudo apt install man-db
fi

# install productivity command line tools
sudo apt update
sudo apt install \
  neofetch tree fasd fd-find fzf bat ripgrep

# neofetch : fast system info
# fasd     : quick access to frequently used files/dirs
# fd-find  : fast search for files (alternative to find)
# fzf      : interactive fuzzy finder
# bat      : cat with syntax highlighting
# ripgrep  : fast content search (alternative to grep)

# bind aliases due to name clash
#   fdfind --> fd
#   batcat --> bat
mkdir -p ~/.local/bin
if [ ! -f ~/.local/bin/fd ]; then
  ln -s $(which fdfind) ~/.local/bin/fd
fi
if [ ! -f ~/.local/bin/bat ]; then
  ln -s $(which batcat) ~/.local/bin/bat
fi

# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz lazygit

