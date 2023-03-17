#!/bin/bash
echo "Setting up Command Line Tools..."

# install productivity command line tools
sudo apt update
sudo apt install \
tree fasd fd-find autojump locate \
bat ack ripgrep \
htop

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

