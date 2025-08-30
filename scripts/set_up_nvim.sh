#!/bin/bash

sudo apt install gcc
sudo snap install nvim --classic

# -n avoids creating a sub-folder inside the old target folder
ln -sfn $DOTFILES/config/nvim ~/.config/nvim
