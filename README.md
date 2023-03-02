# Configure Development Environment

This document contains notes about my personal configuration of development environment on Linux.

Content:

* [Steps to setup a new Debian/Ubuntu machine](#steps-to-setup-a-new-debian/ubuntu-machine)
* [Explanations](#explanations)
  * [Notes dump](#notes-dump)
  * [Packages](#packages)
  * [Plugins](#plugins)
* [References](#references)

## Steps to setup a new Debian/Ubuntu machine
1.  Manual setups
    1.  update and install essential packages
        ```sh
        sudo apt update; sudo apt upgrade; \
        sudo apt install curl git zsh vim tmux; \
        apt list --installed curl git zsh vim tmux
        ```

    1.  generate SSH key
        ```sh
        ssh-keygen -t ed25519 -C "alex.hyang.dev@gmail.com"; \
        eval "$(ssh-agent -s)"; \
        ssh-add ~/.ssh/id_ed25519; \
        cat ~/.ssh/id_ed25519.pub 
        ```
        Add public key to [GitHub account](https://github.com/settings/keys)

    1.  verify GitHub connection using ssh
        ```sh
        ssh -T git@github.com 
        ```

    1.  install Oh My Zsh to manage Zshell
        ```sh
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
        ```

1.  Automatic setups
    ```sh
    git clone git@github.com:alexhyang/dotfiles.git ~/.dotfiles/; \
    echo "Configuring development environment..."; source ~/.dotfiles/bootstrap.sh
    ```

1.  Additional setups
    1.  Debian and Ubuntu
        install nvm and current LTS node
        ```sh
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
        nvm install --lts
        ```

    1.  Debian only
        install online manual pager ("man" command)
        ```sh
        sudo apt install man-db
        ```

## Explanations
### Notes dump
*   remote repo that contains all configuration dotfiles, such as:
    *   shell -- ~/.bashrc, ~/.bash_profile, ~/.zshrc 
    *   git -- ~/.gitconfig
    *   vim -- ~/.vimrc, ~/.vim/
    *   ssh -- ~/.ssh/config
    *   tmux -- ~/.tmux.conf

*   use "redirect" to source files in the dotfiles repo, sensitive information such as customized directory and API keys will be configured locally
    *   symlink, dotfile, etc.

### Packages
*   curl, git, zsh, vim, tmux, htop, tree... (more to be added)

    Detailed list of command line tools see [CLT-ref](https://github.com/alexhyang/research-notes/blob/main/CLT-ref.md).

### Plugins
*   Zsh plugins
    *   git
    *   [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    *   [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions)
    *   [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

*   Vim plugins
    *   Outside the editor
        *   [fugitive.vim: a Git wrapper](https://vimawesome.com/plugin/fugitive-vim)
        *   [nerd tree: tree explore plugin for vim](https://vimawesome.com/plugin/nerdtree-red)
    *   Editor styling and status
        *   [vim colors solarized: precision color scheme for vim editor](https://vimawesome.com/plugin/vim-colors-solarized-ours)
        *   [vim airline: status/tabline for vim](https://vimawesome.com/plugin/vim-airline-superman)
        *   [vim gitgutter: show git diff markers](https://vimawesome.com/plugin/vim-gitgutter)
        *   [tagbar: show outline/structure of classes, functions, etc.](https://vimawesome.com/plugin/tagbar)
        *   [surround.vim: easy operations on surroundings in pairs](https://vimawesome.com/plugin/surround-vim)
    *   Editing, syntax, linting
        *   [youcompleteme: code completion engine for vim](https://vimawesome.com/plugin/youcompleteme)
        *   [Syntastic: syntax checking hacks for vim](https://vimawesome.com/plugin/syntastic)
        *   [vim jsx: React JSX syntax highlighting and indenting](https://vimawesome.com/plugin/vim-jsx)
        *   [enhanced javascript syntax](https://vimawesome.com/plugin/enhanced-javascript-syntax)
        *   [typescript vim: TypeScript syntax](https://vimawesome.com/plugin/typescript-vim)
        *   [indent guides: visually displaying indent levels in code](https://vimawesome.com/plugin/indent-guides)
        *   [ale: syntax checking and semantic errors](https://vimawesome.com/plugin/ale)
        *   [vim prettier: prettier formatter](https://vimawesome.com/plugin/vim-prettier-who-speaks)
        *   [tabular: text fildering and alignment](https://vimawesome.com/plugin/tabular) - [documentation](https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt)
        *   [vim-toml: vim syntax for tmol](https://github.com/cespare/vim-toml)
        *   [markdown syntax: markdown file editing helper](https://vimawesome.com/plugin/markdown-syntax)
        *   [instant markdown preview](https://vimawesome.com/plugin/instant-markdown-vim)
    *   Search
        *   [ack.vim: vim plugin for ack](https://vimawesome.com/plugin/ack-vim)
        *   [ctrlp.vim: fuzzy file, buffer, mru, tag, etc.](https://vimawesome.com/plugin/ctrlp-vim-everything-has-changed)

*   tmux plugins
    *   to be added

## References
*   [My developer workflow using WSL, tmux and Neovim](https://dev.to/nexxeln/my-developer-workflow-using-wsl-tmux-and-neovim-55f5)
*   [Oh My Zsh Plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
*   [Vimawesome - Vim plugins](https://vimawesome.com/)
