# Steps to setup a new Debian/Ubuntu machine
1.  Manual setups
    ```sh
    # update existing packages
    sudo apt update; sudo apt upgrade; 
    # install essential packages
    sudo apt install curl git zsh vim tmux; 
    # verify package versions
    apt list --installed curl git zsh vim tmux 
    ```

    ```sh
    # generate ssh key, and add the public key to GitHub account settings
    ssh-keygen -t ed25519 -C "alex.hyang.dev@gmail.com";
    eval "$(ssh-agent -s)"; 
    ssh-add ~/.ssh/id_ed25519; 
    cat ~/.ssh/id_ed25519.pub 
    ```

    ```sh
    # verify GitHub connection using ssh
    ssh -T git@github.com 
    ```

    ```sh
    # install Oh-My-Zsh to manage Zshell
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
    ```

1.  Automatic setups
    ```sh
    cd ~; git clone git@github.com:alexhyang/dotfiles.git .dotfiles/; cd ~/.dotfiles
    echo "Configuring development environment..."; source bootstrap.sh
    ```

1.  Additional setups
    1.  Debian and Ubuntu
        ```sh
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash # install nvm
        nvm install --lts # install current LTS node
        ```

    1.  Debian only
        ```sh
        sudo apt install man-db # install online manual pager ("man" command)
        ```
