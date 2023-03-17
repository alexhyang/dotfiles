# Linux Dotfiles

This document contains notes about my personal configuration of Ubuntu development environment on UserLAnd.

## Machine setups
1.  install essential packages
    ```sh
    sudo apt update; sudo apt upgrade; \
    sudo apt install curl git zsh vim tmux; \
    apt list --installed curl git zsh vim tmux
    ```
1.  establish GitHub connection
    1.  generate ssh keys
        ```sh
        ssh-keygen -t ed25519 -C "alex.hyang.dev@gmail.com"; \
        eval "$(ssh-agent -s)"; \
        ssh-add ~/.ssh/id_ed25519; \
        cat ~/.ssh/id_ed25519.pub 
        ```
    1.  add public key to [GitHub account](https://github.com/settings/keys)
    1.  verify GitHub connection using ssh
        ```sh
        ssh -T git@github.com 
        ```

1.  setup dotfiles on local machine
    ```sh
    git clone git@github.com:alexhyang/dotfilesLAnd.git ~/.dotfiles/; \
    source ~/.dotfiles/bootstrap.sh
    ```
