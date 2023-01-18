#!bin/sh
echo "\nStarting environment initial setup..."
sudo apt update; sudo apt upgrade

sleep 3
echo "\n\nInstalling packages..." 
sleep 1
sudo apt install tree htop             # install essential ternimal packages (more to be added)
sudo apt install curl git zsh vim tmux # install essential dev tools (more to be added)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash # install nvm and node
nvm install --lts

sleep 3
echo "\n\nVerifying package versions..."
sleep 1
## apt list --installed tree htop curl git zsh vim tmux
## dpkg -l tree htop curl git zsh vim tmux
curl -V
git version
zsh --version
vim --version
tmux -V
nvm --version
node --version

sleep 3
echo "\n\nConfiguring tools..."
sleep 1
echo "\nCopying config files..."
sleep 1
cp config/.gitconfig ~/.gitconfig
cp config/.zshrc ~/.zshrc
cp config/.zshlocalrc ~/.zshlocalrc
cp config/.tmux.conf ~/.tmux.conf
cp config/.vimrc ~/.vimrc
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # install Oh My Zsh
zsh
omz reload
echo "\nInstalling plugins..."
sleep 1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
omz reload
sleep 1
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
