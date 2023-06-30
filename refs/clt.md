# Command Line Tools in Linux

This document explains some useful command line tools in Linux. For list
of tools installed, see [dotfiles/bootstrap.sh](https://github.com/alexhyang/dotfiles/blob/main/bootstrap.sh).

Contents:

* [Command Documents](#command-documents)
* [Directory Structure and Navigation](#directory-structure-and-navigation)
* [File Management](#file-management)
* [Text Search and Manipulation](#text-search-and-manipulation)
* [Processes Monitoring](#processes-monitoring)
* [Command piping](#command-piping)
* [References](#references)

## Command Documents
*   man
*   info
*   tldr (npm install -g tldr)

## Directory and Navigation
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

*   autojump (apt)
*   tree (apt)
*   [broot](https://dystroy.org/broot/file-operations/)
    ```plaintext
    :cr {file}           # create new file under current folder
    :md {directory}      # create a directory under current folder
    :rm {file}           # remove file
    :e {file}            # edit file
    :mv                  # move file (with one panel)
    :mvp                 # move file (with two panels)
    ```

*   nnn
*   ranger

## File Search
*   find
    ```bash
    -name pattern    # base of file name, don't include path in file name pattern
    -path pattern    # file name matches shell pattern
    -type [fd]       # find file or directory
    -size n[cwbkMG]  # file size
    -mtime n         # file modified time
    -exec command    # execute command
    -exec command {} # execute command with {} replaced by each selected file name
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

## File Content Search
*   grep
*   rg (apt ripgrep)

## Processes Monitoring
*   pstree
*   htop (apt)

## Command piping
*   xargs

## Date Manipulation
*   [jq](https://jqlang.github.io/jq/tutorial/)
    ```bash
    jq '.' input.json > output.json    # beautify JSON file
    jq -c '.' input.json > output.json # minify JSON file

    ```

## References
*   [Linux man pages online](https://man7.org/linux/man-pages/)
*   [Manned Org](https://manned.org/)
*   [TLDR pages](https://tldr.sh/)
*   [Ubuntu documentation](https://help.ubuntu.com/community/CommunityHelpWiki)
*   [Missing Semester - Shell Tools](https://missing.csail.mit.edu/2020/shell-tools/)
