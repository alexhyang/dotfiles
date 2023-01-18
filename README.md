# Steps to setup environment on new machine
1.  setup ssh connection
    ```sh
    sudo apt update; sudo apt upgrade; sudo apt install git;
    ls -al ~/.ssh;
    ssh-keygen -t ed25519 -C "alex.hyang.dev@gmail.com" ;
    eval "$(ssh-agent -s)" ;
    ssh-add ~/.ssh/id_ed25519 ;
    ```
    ```sh
    cat ~/.ssh/id_ed25519.pub
    ssh -T git@github.com
    ```

1.  clone this repo
    ```
    cd ~
    git clone git@github.com:alexhyang/dotfiles.git .dotfiles/
    ```

1.  run `./bootstrap.sh` under .dotfiles/


