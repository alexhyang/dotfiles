# Steps to setup a new Debian/Ubuntu machine
1.  Manual setups
    ```sh
    echo; echo "Start manual setups..."
    sudo apt update; sudo apt upgrade; sudo apt install git curl zsh;
    ls -al ~/.ssh
    ssh-keygen -t ed25519 -C "alex.hyang.dev@gmail.com"
    ```
    ```sh
    echo; echo "Configuring ssh connection"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub
    ```
    ```sh
    echo; echo "Finishing up manual setups..."
    ssh -T git@github.com
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```

1.  Automatic setups
    ```sh
    cd ~; git clone git@github.com:alexhyang/dotfiles.git .dotfiles/; cd ~/.dotfiles
    echo "Installing terminal packages..."; sleep 3; source bootstrap.sh
    echo "Environment Setup completed!"
    ```
