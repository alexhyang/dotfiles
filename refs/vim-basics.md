# Vim Quick Start

This document introduces basic commands of Vim. For more tips, see [advanced notes](https://github.com/alexhyang/dotfiles/blob/main/refs/vim-advanced.md).

Contents:

* [Commands](#commands)
  * [Basic file commands](#basic-file-commands)
  * [Basic vim setup commands](#basic-vim-setup-commands)
  * [Movement](#movement)
  * [Window](#window)
  * [Editing](#editing)
    * [Insert](#insert)
    * [Change or replace](#change-or-replace)
    * [Select, delete, copy, paste](#select,-delete,-copy,-paste)
    * [Other](#other)
* [Settings](#settings)
  * [Theme](#theme)
  * [Line numbering](#line-numbering)
  * [Status line](#status-line)
  * [Tab](#tab)
  * [vimrc example](#vimrc-example)
* [Plugins](#plugins)
* [References and resources](#references-and-resources)

## Commands
### Basic file commands
    :help [keyword]         # search for help
    :e [file]               # open file	
    :w                      # save file
    :w [filename]           # save file with given name
    :wq                     # save file and quit vim
    :q!                     # quit without saving

### Basic vim setup commands
    :set number             # toggle on number of lines
    :set nonumber           # toggle off number of lines
    :set relativenumber     # toggle on relative number of lines
    :set norelativenumber   # toggle off relative number of lines

### Movement 
    k/j/h/l  # move char            at a time (up/down/left/right)
    w/b/e/ge # move word            at a time (start of next/previous word, end of a next/previous word)
    ( / )    # move sentence        at a time (start of previous/next sentence
    { / }    # move paragraph/block at a time (start of previous/next paragraph or block)
    t[char]  # move to                        (right before next given char in line
    f[char]  # move to                        (next given char in line
    F[char]  # move to                        (previous given char in line
    0/$      # move to                        (beginning/end of a line
    ^        # move to                        (beginning word in the line 
    H/L/M    # move to                        (top/bottom/middle of screen
    gg/G     # move to                        (satrt/end of the file

### Window
    ^w h/s      # split window vertically/horizontally
    ^w k/j/h/l  # navigate between windows (up/down/left/right)

### Editing
#### Insert
    i/a         # insert to the left/right of cursor
    A           # insert to the end of this line
    o/O         # add a new line below/above, and enter insert mode
    c[action]   # clear text with action, and enter insert mode
    s/S         # clear current character/line, and enter insert mode

#### Change or replace
    r[char]     # replace character below cursor
    R           # enter replace mode instead of insert mode
    ~           # change the case of a character
    >>/<<       # indent or deindent line

  in command mode

    :s/[oldstring]/[newstring]          # replace first match in this line only
    :s/[oldstring]/[newstring]/g        # replace all matches in this line only
    :1,5s/[oldstring]/[newstring]       # replace first match from line 1 to line 5
    :1,5s/[oldstring]/[newstring]/g     # replace all matches from line 1 to line 5
    :%s/[oldstring]/[newstring]         # replace first match in all lines throughout the file
    :%s/[oldstring]/[newstring]/g       # replace all matches in all lines throughout the file

#### Select, delete, copy, paste
    v/V         # highlight a character/line (move cursor to select text after "v")
    ^v          # select block
    yy/dd       # copies/delete a line
    yw/dw       # copies/delete a word
    p/P         # paste copied text below/above
    y$/D        # copies/delete from cursor to end of the line
    d0          # delete from cursor to beginning of line
    dgg/dG      # delete from cursor to beginning/end of file
    d           # delete hightlighted text
    x           # delete single character

#### Other
    u                       # undo last operation
    ^r                      # redo last undo
    .                       # repeat last action
    N[action/movement]      # do n times eg. 4j 
    q[key]/q                # (in command mode) start/stop recording macro
    ^s/^q                   # freeze/unfreeze Vim

## Settings
### Theme
    :colorscheme ron        # set Vim theme to "ron"
A list of vim themes:
*   blue
*   darkblue
*   delek
*   desert
*   elflord
*   evening
*   industry
*   koehler
*   morning
*   murphy
*   pablo
*   peachpuff
*   ron
*   shine
*   slate
*   torte
*   zellner

### Line numbering
    :set number             # toggle on number of lines
    :set nonumber           # toggle off number of lines
    :set relativenumber     # toggle on relative number of lines
    :set norelativenumber   # toggle off relative number of lines

### Status line
    :set laststatus=2       # 0: never shown, 1: shown only with multiple windows, 2; always
    :set statusline+=
    :set statusline+=\%F    # full path to file
    :set statusline+=\%f    # path to file
    :set statusline+=%=     # switch to the right side

    :set statusline+=\ %y   # filetype
    :set statusline+=\ %{&fileencoding?&fileenconding:&encoding}
    :set statusline+=\ [%{&fileformat}]
    :set statusline+=\ %p%%     # %p%%: current percentage
    :set statusline+=\ %l:%c    # %l: current line, %c: current column
    :set statusline+=\ %L       # %L: total line
    :set statusline+=\

### Tab
    :set tabstop=4          # number of spaces for a tab (default = 8)
    :set shiftwidth=4       # number of spaces for indent 
    :set expandtab          # use spaces to insert tabs

### vimrc example

comment with one double quote (") at the beginning of specific line
```sh
set number

set laststatus=2
set statusline+=
set statusline+=\%F
set statusline+=%=

set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileenconding:&encoding}
set statusline+=\ [%{&fileformat}]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

set tabstop=4
set shiftwidth=4
set expandtab
```

[customized .vimrc](../config/.vimrc)

## Plugins
1.  *Install Vundle (Vim package manager)*:
    ```
    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```


2.  *Add the config scripts to .vimrc*:
    ```
    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/syntastic'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'altercation/vim-colors-solarized'
    " Plugin 'valloric/youcompleteme'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'leafgarland/typescript-vim'
    call vundle#end()            " required
    filetype plugin indent on    " required
    ```


3.  *open vim editor*:
    ```
    $ vim
    ```

    *   install plugin `:PluginInstall`
    *   verify installed plugins `:PluginList`
    *   uninstall plugins
        remove plugin from .vimrc, then `:PluginClean`


## References and resources
*   [Best Vim Tips](https://vim.fandom.com/wiki/Best_Vim_Tips)
*   [Vim Doc - Statusline](http://vimdoc.sourceforge.net/htmldoc/options.html#'statusline')
*   [Vim Doc - Tabstop](http://vimdoc.sourceforge.net/htmldoc/options.html#'tabstop')
*   [Learn Vimscript](https://learnvimscriptthehardway.stevelosh.com/chapters/17.html) 
*   [Learn Vimscript the hard way](https://learnvimscriptthehardway.stevelosh.com/)
*   [Vundle GitHub repo (Vim package manager)](https://github.com/VundleVim/Vundle.vim)
*   [Search and Replace in Vim -- blog](https://www.baeldung.com/linux/vim-search-replace)
*   [Find and Replace in Vim/Vi -- blog](https://linuxize.com/post/vim-find-replace/)
