# Linux Dotfiles

This document contains notes about my personal configuration of development
environment on Debian-based Linux distributions. For configuration on Linux on
Android, checkout the [android branch][android-branch-ref].

Content:

* [Machine setups](#machine-setups)
  * [Essentials](#essentials)
  * [Useful](#useful)
* [Explanations](#explanations)
  * [Dotfiles](#dotfiles)
  * [Plugins](#plugins)
* [References](#references)

## Machine setups
### Essentials

1.  install essential packages

    ```sh
    sudo apt update; sudo apt upgrade; \
    sudo apt install curl git zsh vim tmux; \
    apt list --installed curl git zsh vim tmux
    ```

    `sudo apt update` updates package information,
    `sudo apt upgrade` installs available upgrades of all installed packages,
    `apt list --installed curl git zsh vim tmux` verifies packages are
         successfully installed and ready for the next steps

1.  establish GitHub connection

    1.  [generate ssh keys][sshgen-ref]

        ```sh
        ssh-keygen -t ed25519 -C "your_email@example.com"; \
        eval "$(ssh-agent -s)"; \
        ssh-add ~/.ssh/id_ed25519; \
        cat ~/.ssh/id_ed25519.pub
        ```

        `ssh-keygen` creates a new SSH key (-t specifies type of key, -C
        provides a comment),
        `eval` executes arguments (i.e. given text) as command in current shell,
        `ssh-agent -s` generates bash commands as text,
        `eval "$(ssh-agent -s)"` starts the ssh-agent in the background,
        `ssh-add` adds the generated private key to the ssh-agent,
        `cat` shows content in a file (here it prints the generated public
        key (begins with ssh-ed25519 and ends with the email address comment))

    1.  add public key to [GitHub keys](https://github.com/settings/keys)

    1.  verify GitHub connection using ssh

        ```sh
        ssh -T git@github.com
        ```

        `ssh -T` runs SSH without opening an interactive shell (i.e. disable
        pseudo-terminal allocation), `-T` is commonly used when executing
        remote commands or when a service only needs authentication and data
        transfer, not an interactive shell

1.  setup dotfiles on local machine

    ```sh
    git clone git@github.com:alexhyang/dotfiles.git ~/.dotfiles/; \
    source ~/.dotfiles/bootstrap.sh
    ```

    `git clone` copies remote repository to local machine in ~/.dotfiles

1.  install OhMyZsh or Zim as zsh configuration manager

    *   change default shell to zsh, then start zsh

        ```bash
        chsh -s $(which zsh) | zsh
        ```

        `chsh -s` set shell to the given path

    *   [OhMyZsh](https://github.com/ohmyzsh/ohmyzsh)

        ```bash
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        source ~/.dotfiles/scripts/set_up_zsh_omz.sh
        ```

        `sh -c` executes a command in bash then exit,
        `curl` transfers data from or to a server using various protocols,
        `curl -fsSL` suppresses progress bar (-s, --silent) but still shows
        error messages (-S, --show-error), fails silently on HTTP errors (-f,
        --fail) and follows request redirection (-L, --location)

        To uninstall omz run `uninstall_oh_my_zsh` in zsh command line, then
        remove soft link by `rm ~/.zshrc`

    *   [Zim](https://github.com/zimfw/zimfw)

        ```bash
        curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
        source ~/.dotfiles/scripts/set_up_zsh_zim.sh
        ```

        To uninstall zim:
        ```bash
        rm ~/.zshrc ~/.zimrc ~/.zshenv
        rm -fr ~/.zim
        ```


### Useful

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

[android-branch-ref]: https://github.com/alexhyang/dotfiles/tree/android
[sshgen-ref]: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux
