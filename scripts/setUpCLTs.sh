#!/bin/bash
echo "Setting up Command Line Tools..."

# install productivity command line tools
sudo apt update
sudo apt install \
tree fasd fd-find fzf autojump locate \
bat ack ripgrep \
htop

# bind aliases due to name clash
#   fdfind --> fd
#   batcat --> bat
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
ln -s /usr/bin/batcat ~/.local/bin/bat

# install broot
if [ ! -f "/usr/local/bin/broot" ]
then
    curl -o broot -L https://dystroy.org/broot/download/x86_64-linux/broot
    sudo mv broot /usr/local/bin
    sudo chmod +x /usr/local/bin/broot
    broot
fi
