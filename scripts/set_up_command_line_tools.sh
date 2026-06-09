#!/bin/bash
echo "Setting up Command Line Tools..."
if [ -f /etc/os-release ]; then
    . /etc/os-release

    case "$ID" in
      fedora)
          # starklauf: German word meaning "strong run". To upgrade packages
          alias starklauf="sudo dnf upgrade --refresh"
          # neuwerk: German word meaning "new work". To install packages
          alias neuwerk="sudo dnf install"
          ;;
      arch)
          alias starklauf="sudo pacman -Syu"
          alias neuwerk="sudo dnf install"
          ;;
      ubuntu|debian)
          alias starklauf="sudo apt update && sudo apt upgrade"
          alias neuwerk="sudo apt install -y"
          ;;
    esac
fi

# install man page for debian
machine=$(cat /etc/os-release | grep -E "^NAME=\".*\"" | sed -E 's/^.*?"(\w+)(\s?).*"$/\1/')
if [[ $machine == "Debian" ]]; then
  neuwerk man-db
fi

# install productivity command line tools
starklauf; neuwerk tree fd-find fzf bat ripgrep autojump
case "$ID" in
  fedora)
    neuwerk fastfetch
    ;;
  ubuntu)
    neuwerk neofetch fasd 
    ;;
esac

# neofetch : fast system info
# fasd     : quick access to frequently used files/dirs
# fd-find  : fast search for files (alternative to find)
# fzf      : interactive fuzzy finder
# bat      : cat with syntax highlighting
# ripgrep  : fast content search (alternative to grep)
# autojump : quick navigation in directory

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
case "$ID" in
  fedora)
    neuwerk --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
    neuwerk lazygit
    ;;
  ubuntu)
    if awk -v ver="$VERSION_ID" 'BEGIN { exit !(ver <= 25.04) }'; then
      LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
      LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')
      curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
      tar xf lazygit.tar.gz lazygit
      sudo install lazygit -D -t /usr/local/bin/
    else
      neuwerk lazygit
    fi
    ;;
esac

