#!bin/sh
echo; echo "Installing Zsh plugins..."; sleep 1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo; echo "Reloading Zsh..."; sleep 1;
omz reload

echo; echo "Copying zsh config files..."; sleep 1;
cp config/.zshrc ~/.zshrc
cp config/.zshlocalrc ~/.zshlocalrc
