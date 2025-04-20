# Linux Dotfiles

This document contains notes about my personal configuration
of development environment on Debian-based Linux distributions.
For configuration on Linux on Android, checkout the [android
branch](https://github.com/alexhyang/dotfiles/tree/android).

Content:

* [Machine setups](#machine-setups)
* [Explanations](#explanations)
  * [Dotfiles](#dotfiles)
  * [Plugins](#plugins)
* [References](#references)

## Machine setups
1.  install essential packages
    ```sh
    sudo apt update; sudo apt upgrade; \
    sudo apt install curl git zsh vim tmux; \
    apt list --installed curl git zsh vim tmux
    ```

    zsh configuration manager: OhMyZsh
    ```bash
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```

1.  establish GitHub connection
    1.  generate ssh keys
        ```sh
        ssh-keygen -t ed25519 -C "<email-address>@gmail.com"; \
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
    git clone git@github.com:alexhyang/dotfiles.git ~/.dotfiles/; \
    source ~/.dotfiles/bootstrap.sh
    ```

1.  install Node.js
    ```bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash; \
    omz reload
    ```
    ```bash
    nvm install --lts; nvm ls
    ```

## Explanations
### Dotfiles
*   some tools to be configured through dotfiles:
    *   shell -- `~/.bashrc, ~/.bash_profile, ~/.zshrc`
    *   git -- `~/.gitconfig`
    *   vim -- `~/.vimrc`
    *   ssh -- `~/.ssh/config`
    *   tmux -- `~/.tmux.conf`
    *   aliases, functions, local environment variables -- `~/.aliases,
        ~/.bash_aliases, ~/.shell_utils, ~/.local_env`

*   use "redirect" to source files in the dotfiles repo,
    sensitive information such as customized directory and
    API keys will be configured locally
    *   symlink, dotfile, etc.

*   files created by OS:
    *   Ubuntu 22.04
        `~/.bashrc, ~/.bash_logout, ~/.profile, ~/.motd_shown`
    *   Debian
        `~/.bashrc, ~/.bash_logout, ~/.profile`

Detailed list of command line tools see [Command_Line_Tools-ref](https://github.com/alexhyang/dotfiles/blob/main/refs/clt.md).

### Plugins
*   Zsh plugins
    *   git
    *   [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    *   [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions)
    *   [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    *   [ohmyzsh list of plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)

*   Vim plugins and their help files

    *   List of plugins:
        *   Check plugin list in `.vimrc`, or
        *   In vim, open help file using type `:help` command in normal mode.
            Search "local-additions" with `/local-additions` command in help
            file. Use `ctrl ]` to open hyperlink (go to tag) and `ctrl t` to
            return from opened hyperlink (ctag return), or `ctrl o` to go
            back.

*   tmux plugins
    *   see [tmux.conf](./config/.tmux.conf)

## References
*   [My developer workflow using WSL, tmux and Neovim](https://dev.to/nexxeln/my-developer-workflow-using-wsl-tmux-and-neovim-55f5)
*   [Oh My Zsh Plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
*   [Vimawesome - Vim plugins](https://vimawesome.com/)
*   [Debian packages of R software](https://cran.r-project.org/bin/linux/debian/)
*   [A guide to dotfiles - blog post](https://dotfiles.github.io/)
*   [Shell startup scripts - blog post](https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html)
*   [Install Node.js on WSL2](https://learn.microsoft.com/en-ca/windows/dev-environment/javascript/nodejs-on-wsl)
