# Command Line Tools in Linux

This document explains some useful command line tools in Linux. For list
of tools installed, see [dotfiles/bootstrap.sh](https://github.com/alexhyang/dotfiles/blob/main/bootstrap.sh).

Contents:

* [Shell](#shell)
  * [Finding help for commands](#finding-help-for-commands)
  * [Working remotely](#working-remotely)
  * [Signing (and protect) your work](#signing-(and-protect)-your-work)
  * [Navigating in terminal](#navigating-in-terminal)
  * [Searching files](#searching-files)
  * [Searching file content](#searching-file-content)
  * [Monitoring processes](#monitoring-processes)
  * [Piping commands](#piping-commands)
  * [Manipulating data](#manipulating-data)
* [Programming Languages](#programming-languages)
  * [Java](#java)
* [References](#references)

## Shell

### Finding help for commands

```bash
man <command>                               # display the manual pages
info <command>                              # show more in-depth documentation
tldr                                        # simplified man pages (npm install -g tldr)
```

### Working remotely

*   ssh & scp
    ```bash
    eval $(ssh-agent); ssh-add ~/.ssh/<private-key>; ssh-add -l
                                            # set up ssh agent for no passphrase
    ssh <username>@<remote_host>            # log in to remote machine
    ssh-keygen                              # generate ssh key pairs
    ssh-copy-id <username>@<remote_host>    # copy public key to remote machine
    scp <origin_file_path> <dst_file_path>  # copy file to remote machine
    ```

### Signing (and protect) your work

*   gpg
    ```bash
    gpg --version                           # check gpg installation on machine
    gpg --full-generate-key                 # generate gpg key
    gpg --list-secret-keys --keyid-format LONG
                                            # list gpg secret keys
    git config --global user.signingkey <private-key>
    git config --global user.gpgsign true
                                            # sign git commits
    gpg --armor --export <private-key>      # export public key
    ```

### Navigating in terminal
*   [fasd (frecency, quick access to files and dirs)](https://github.com/clvv/fasd)
    ```bash
    # Setup
    sudo apt install fasd

    # Commands
    # default fasd aliases
    alias a='fasd -a'        # any
    alias s='fasd -si'       # show / search / select
    alias d='fasd -d'        # directory
    alias f='fasd -f'        # file
    alias sd='fasd -sid'     # interactive directory selection
    alias sf='fasd -sif'     # interactive file selection
    alias z='fasd_cd -d'     # cd, same functionality as j in autojump
    alias zz='fasd_cd -d -i' # cd with interactive selection

    # ohmyzsh plugins
    alias v='fasd -f -e "$EDITOR"'
    alias o='fasd -a -e xdg-open'
    alias j='zz'
    ```
*   [autojump (easy navigation from command line)](https://github.com/wting/autojump)
    ```bash
    # set up
    sudo apt install autojump
    j <pattern>              # jump to a directory containing given pattern
    jc <pattern>             # jump to a subdir containing given pattern
    jo <pattern>             # open directory in system file manager
    j --purge                # clean invalid jump entries in database
    ```

*   tree
    ```bash
    # set up
    sudo apt install tree
    tree -L <num>            # print files and dirs
    ```

*   [broot](https://dystroy.org/broot/file-operations/)
    ```plaintext
    # file operations
    :cr {file}           # create new file under current folder
    :md {directory}      # create a directory under current folder
    :rm {file}           # remove file
    :e {file}            # edit file
    :mv                  # move file (with one panel)
    :mvp                 # move file (with two panels)

    # Git information
    :gf                  # toggle git information
    :gi                  # toggle use of .gitignore
    :gs                  # toggle git status
    ```

*   nnn
*   ranger

### Searching files

*   find
    ```bash
    -name pattern    # base of file name, don't include path in file name pattern
    -path pattern    # file name matches shell pattern
    -type [fd]       # find file or directory
    -size n[cwbkMG]  # file size
    -mtime n         # file modified time
    -exec command    # execute command
    -exec command {} # execute command with {} replaced by each selected file name

    # Example
    find . -type f -name "*.js" -exec mv {} ../ \;  # move all .js files to parent folder
    ```

*   [fd (alternative to find)](https://github.com/sharkdp/fd)
    ```bash
    # Setup
    sudo apt install fd-find
    ln -s $(which fddinf) ~/.local/bin/fd
    export PATH=$HOME/.local/bin:$PATH

    # Commands
    fd "string|regex"
    fd "^foo"
    fd --extension txt
    fd "string|regex" path/to/dir
    fd --hidden --no-ignore "string|regex"
    fd "string|regex" --exec command

    # Example
    fd -e js -x mv {} ../            # move all .js files to parent folder
    ```

*   [fzf (fuffzy finder)](https://github.com/junegunn/fzf)
    ```bash
    # Setup
    sudo apt install fzf

    # Commands
    find * -type f | fzf > selected  # read list from STDIN, write selected to STDOUT
    vim $(fzf)
    fzf --preview 'cat {}'  # find files with preview

    # terminal key bindings
    ^t      # paste the selected files and directories onto the command line
    ^r      # paste the selected command from history onto the command line
    M-c     # cd into the selected directory

    ```

*   locate (apt)
*   tar & gzip

### Searching file content
*   rg (apt ripgrep)
*   grep

### Monitoring processes
*   pstree
*   htop (apt)

### Piping commands
*   xargs

### Manipulating data
*   [jq](https://jqlang.github.io/jq/tutorial/) (JSON formatter)
    ```bash
    jq '.' input.json > output.json    # beautify JSON file
    jq -c '.' input.json > output.json # minify JSON file

    ```

## Programming Languages

### Java
    ```bash
    jdep # visualize packages and dependencies (built-in tool in JDK)
    ```

## References
*   [Linux man pages online](https://man7.org/linux/man-pages/)
*   [Manned Org](https://manned.org/)
*   [TLDR pages](https://tldr.sh/)
*   [Ubuntu documentation](https://help.ubuntu.com/community/CommunityHelpWiki)
*   [Missing Semester - Shell Tools](https://missing.csail.mit.edu/2020/shell-tools/)
