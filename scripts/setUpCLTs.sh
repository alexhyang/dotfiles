#!/bin/bash
echo "Setting up Command Line Tools..."

# install productivity command line tools
sudo apt update
sudo apt install \
  tree fasd fd-find fzf autojump locate \
  bat ack ripgrep rename \
  htop

# install man page for debian
machine=$(cat /etc/os-release | grep -E "^NAME=\".*\"" | sed -E 's/^.*?"(\w+)(\s?).*"$/\1/')
if [[ $machine == "Debian" ]]; then
  sudo apt install man-db
fi

# bind aliases due to name clash
#   fdfind --> fd
#   batcat --> bat
mkdir -p ~/.local/bin
if [ ! -f ~/.local/bin/fd ]; then
  ln -s $(which fdfind) ~/.local/bin/fd
fi
if [ ! -f ~/.local/bin/bat ]; then
  ln -s /usr/bin/batcat ~/.local/bin/bat
fi

# install broot
if [ ! -f "/usr/local/bin/broot" ]; then
  curl -o broot -L https://dystroy.org/broot/download/x86_64-linux/broot
  sudo mv broot /usr/local/bin
  sudo chmod +x /usr/local/bin/broot
  broot
fi

# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz lazygit

# optional programming languages
installProgrammingLanguage() {
  read "confirm?Install $1? [y/N] "
  if [[ $confirm =~ ^[yY]$ ]]; then
    sudo apt install $2
  fi
}

installProgrammingLanguage R r-base-core
installProgrammingLanguage Java17 openjdk-17-jdk
installProgrammingLanguage pip python3-pip

# project-specific tools
# jq: lightweight JSON processor
sudo apt install jq
