#!bin/sh
echo "Installing packages..."; sleep 0.3;
sudo apt install tree htop             # install essential ternimal packages (more to be added)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash # install nvm and node
nvm install --lts

echo; echo "Verifying package versions..."; sleep 0.3;
apt list --installed curl git zsh vim tmux tree htop 
## dpkg -l tree htop curl git zsh vim tmux
# curl -V
# git version
# zsh --version
# vim --version
# tmux -V
# nvm --version
# node --version

echo; echo "Copying git config files..."; sleep 0.3
cp config/.gitconfig ~/.gitconfig

echo; echo "Configuring zsh..."; sleep 0.2; source setUpZsh.sh
echo; echo "Configuring vim..."; sleep 0.2; source setUpVim.sh
echo; echo "Configuring tmux..."; sleep 0.2; source setUpTmux.sh
echo "Automatic setups finished!"

echo "Now install Vim plugins in editor..."; sleep 1
echo "Last step: \nrun :PluginInstall" >>  temp.md
vim temp.md
rm temp.md
echo "Vim plugins installed!"; sleep 0.3

if [ -d "$HOME/.vim/bundle/vim-colors-solarized" ]
then
  echo "Copying Solarized color file..."
  if [ ! -d "$HOME/.vim/colors" ]
  then
    mkdir $HOME/.vim/colors/
  fi
  cd $HOME/.vim/
  cp ./bundle/vim-colors-solarized/colors/solarized.vim ./colors/solarized.vim
  echo "solarized.vim copied!"
fi

cd ~
echo "New Machine Configuration Finished!"
