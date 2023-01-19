#!bin/sh
echo; echo "Installing packages..."; sleep 1;
sudo apt install tree htop             # install essential ternimal packages (more to be added)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash # install nvm and node
nvm install --lts

echo; echo "Verifying package versions..."; sleep 1;
apt list --installed curl git zsh vim tmux tree htop 
## dpkg -l tree htop curl git zsh vim tmux
# curl -V
# git version
# zsh --version
# vim --version
# tmux -V
# nvm --version
# node --version

echo; echo "Copying git config files..."; sleep 1
cp config/.gitconfig ~/.gitconfig

echo; echo "Configuring zsh..."; sleep 0.6; source setUpZsh.sh
echo; echo "Configuring vim..."; sleep 0.6; source setUpVim.sh
echo; echo "Configuring tmux..."; sleep 0.6; source setUpTmux.sh
echo "Automatic setups finished!"

echo "Now install Vim plugins in editor..."; sleep 2
echo "run :PluginInstall" >>  temp.md
vim temp.md
rm temp.md
if [ -d "$HOME/.vim/bundle/vim-colors-solarized" ]
then
  echo "Copying Solarized color file..."
  mkdir $HOME/.vim/colors/
  cd $HOME/.vim/
  cp ./bundle/vim-colors-solarized/colors/solarized.vim ./colors/solarized.vim
  "solarized.vim copied!"
fi
