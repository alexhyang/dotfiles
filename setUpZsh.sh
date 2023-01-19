#!bin/sh
echo "Installing Zsh plugins...";
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]
then    
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  echo "Zsh syntax highlighting plugin installed!"; echo
fi

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions" ]
then    
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
  echo "Zsh completions plugin installed!"; echo
fi

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]
then    
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "Zsh autosuggestions plugin installed!"; echo
fi

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k" ]
then    
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  echo "Zsh powerlevel10k installed!"; echo
fi

echo "Copying zsh config files...";
cp config/.zshrc ~/.zshrc
echo ".zshrc updated"

if [ ! -f "$HOME/.zshlocalrc" ]
then
  cat ~/.zshlocalrc ~/.zshlocalrc_backup
  cp config/.zshlocalrc ~/.zshlocalrc
  echo ".zshlocalrc file created"
fi

echo "Zsh configuration done!"
