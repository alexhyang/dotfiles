# Steps to setup a new Debian/Ubuntu machine
1.  Manual setups
    1.  update and install packages
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
        ```markdown
        Add public key to [GitHub account](https://github.com/settings/keys)
        ```

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
    cd ~; \
    git clone git@github.com:alexhyang/dotfiles.git .dotfiles/; \
    cd ~/.dotfiles; \
    echo "Configuring development environment..."; source bootstrap.sh
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
