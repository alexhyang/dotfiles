# Steps to setup environment on new machine
1.  clone this repo
    ```
    sudo apt update; sudo apt install git
    cd ~
    git clone git@github.com:alexhyang/dotfiles.git .dotfiles/
    ```

1.  run `./bootstrap.sh` under .dotfiles/

1.  setup ssh connection
    ```sh
    ls -al ~/.ssh
    ssh-keygen -t ed25519 -C "your_email@example.com"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub
    ssh -T git@github.com
    ```

