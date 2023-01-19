#!bin/sh
echo "Installing Zsh plugins..."; sleep 1
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

echo "Copying zsh config files..."; sleep 1;
cp config/.zshrc ~/.zshrc
echo ".zshrc updated"

if [ ! -f "$HOME/.zshlocalrc" ]
then
  cat ~/.zshlocalrc ~/.zshlocalrc_backup
  cp config/.zshlocalrc ~/.zshlocalrc
  echo ".zshlocalrc file created"
fi

echo "Zsh configuration done!"
