" =====================================
"         Common Vim settings 
" =====================================
syntax on 

" line numbers:
set number
set relativenumber

" search case sensitivity
set ignorecase   " case-insensitive during string search
set smartcase    " case-sensitive when Capital letters appear

" enable searching as you type
set incsearch 

" unbind some useless default key bindings
" 'Q' in normal mode enters Ex mode
nmap Q <Nop>

" tab size, use spaces for tabs, code indentation size
set tabstop=2
set expandtab
set shiftwidth=2

" add mouse support
set mouse=n

" change backspace behavior
set backspace=indent,eol,start

" set background and colorscheme
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

" disable audible bell
set noerrorbells visualbell t_vb=

" disallow arrow keys in normal mode and insert mode
" normal mode
nnoremap <Left>  : echoe "Use h"<CR>
nnoremap <Right> : echoe "Use l"<CR>
nnoremap <Up>    : echoe "Use k"<CR>
nnoremap <Down>  : echoe "Use j"<CR>
" insert mode
inoremap <Left>  <ESC>: echoe "Use h"<CR>
inoremap <Right> <ESC>: echoe "Use l"<CR>
inoremap <Up>    <ESC>: echoe "Use k"<CR>
inoremap <Down>  <ESC>: echoe "Use j"<CR>

" spell checking
set spell spelllang=en_us

" wrap linebreak
set wrap linebreak

" =====================================
"         Vundle
" =====================================
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" ===================================================
"         Vim Plugins from VimAwesome
" ===================================================
" Vim bundle (vim plugin manager)
Plugin 'VundleVim/Vundle.vim'


" ==============================
" ====  outside the editor  ====
" ==============================

" ---------------------------------------
" fugitive.vim -- a Git wrapper 
" ---------------------------------------
" (https://vimawesome.com/plugin/fugitive-vim)
" :G
Plugin 'tpope/vim-fugitive'


" ----------------------------------------
" nerd tree -- tree explore plugin for vim 
" ----------------------------------------
" (https://vimawesome.com/plugin/nerdtree-red)
" :NERDTree
Plugin 'scrooloose/nerdtree'


" ==============================
" ======  editor styling  ======
" ==============================

" ----------------------------------------
" vim colors solarized: -- precision color scheme for vim editor 
" ----------------------------------------
" (https://vimawesome.com/plugin/vim-colors-solarized-ours)
Plugin 'altercation/vim-colors-solarized'


" ==============================
" ======  editor status  ======
" ==============================

" ----------------------------------------
" vim airline -- status/tabline for vim 
" ----------------------------------------
" (https://vimawesome.com/plugin/vim-airline-superman)
Plugin 'vim-airline/vim-airline'


" ----------------------------------------
" vim gitgutter -- shows git diff markers 
" ----------------------------------------
" (https://vimawesome.com/plugin/vim-gitgutter)
Plugin 'airblade/vim-gitgutter'


" ----------------------------------------
" tagbar -- show outline/structure of classes, functions, etc. 
" ----------------------------------------
" (https://vimawesome.com/plugin/tagbar)
" Plugin 'majutsushi/tagbar'


" ----------------------------------------
" surroudn.vim -- easy operations on surroundings in pairs 
" ----------------------------------------
" (https://vimawesome.com/plugin/surround-vim)
Plugin 'tpope/vim-surround'
 

" =======================================
" ====  editing, syntax and linting  ====
" =======================================

" ----------------------------------------
" youcompleteme -- code completion engine for vim
" ----------------------------------------
" Plugin 'valloric/youcompleteme'


" ----------------------------------------
" Syntastic -- syntax checking hacks for vim 
" ----------------------------------------
" (https://vimawesome.com/plugin/syntastic)
Plugin 'scrooloose/syntastic'

" ----------------------------------------
" vim jsx -- React JSX syntax highlighting and indenting 
" ----------------------------------------
" (https://vimawesome.com/plugin/vim-jsx)
Plugin 'mxw/vim-jsx'

" ----------------------------------------
" Enhanced JavaScript syntax
" ----------------------------------------
" (https://vimawesome.com/plugin/enhanced-javascript-syntax)
Plugin 'jelera/vim-javascript-syntax'


" ----------------------------------------
" typescript vim -- TypeScript syntax 
" ----------------------------------------
" (https://vimawesome.com/plugin/typescript-vim)
Plugin 'leafgarland/typescript-vim'


" ----------------------------------------
" indent guides -- visually displaying indent levels in code
" ----------------------------------------
" (https://vimawesome.com/plugin/indent-guides)
Plugin 'nathanaelkane/vim-indent-guides'


" ----------------------------------------
" ale (async lint engine) -- syntax checking and semantic errors
" ----------------------------------------
" (https://vimawesome.com/plugin/ale)
Plugin 'w0rp/ale'


" ----------------------------------------
" vim prettier
" ----------------------------------------
" (https://vimawesome.com/plugin/vim-prettier-who-speaks) 
Plugin 'prettier/vim-prettier'


" ----------------------------------------
" Tabular -- vim script for text fildering and alignment
" ----------------------------------------
" (https://vimawesome.com/plugin/tabular)
" [documentation](https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt)
Plugin 'godlygeek/tabular'

" commands:
"     :Tablular /<align-symbol>


" ----------------------------------------
" vim-toml -- vim syntax for toml
" ----------------------------------------
" (https://github.com/cespare/vim-toml)
Plugin 'cespare/vim-toml'


" ----------------------------------------
" markdown syntax -- markdown vim mode (fold levels)
" ----------------------------------------
" (https://vimawesome.com/plugin/markdown-syntax)
Plugin 'plasticboy/vim-markdown'

" commands:
" whole file:
"     zr/zR: show details level by level/all the way down
"     zm/zM: hide details level by level/all the way up
" cursor position only:
"     za/zA: show details level by level/all the way down
"     zc/zC: hide details level by level/all the way up


" ----------------------------------------
" instant markdown preview
" ----------------------------------------
" (https://vimawesome.com/plugin/instant-markdown-vim)
Plugin 'suan/vim-instant-markdown'


call vundle#end()            " required
" filetype plugin indent on
"   (enable loading the indent file for specific file types)
filetype plugin indent on    " required

" filetype plugin on 
"   (enable loading the plugin files for specific file types)
" required by:
"   markdown-syntax:
"     - :TableFormat
"     - :Toc, :Toch, :Toct, Tocv
"     - :InsertToc, InsertNToc
" Note: `filetype plugin on` is
"       included in `filetype plugin indent on`

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" ===================================================
"          plugin configuration 
" ===================================================

" --------------------------------
" plugin: NERDTree
" --------------------------------
nmap <F7> :NERDTree<CR>

" --------------------------------
" plugin: tag
" --------------------------------
nmap <F8> :TagbarToggle<CR>

" --------------------------------
" plugin: vim-indent-guides
" --------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgrey

" --------------------------------
" plugin: ale
" --------------------------------
let g:ale_sign_colunm_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" --------------------------------
" plugin: vim-prettier
" --------------------------------
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" --------------------------------
" plugin: markdown-syntax
" --------------------------------
let g:vim_markdown_toc_autofit = 1
set conceallevel=2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" --------------------------------
" plugin: instant-markdown-vim
" --------------------------------
let g:instant_markdown_autostart = 1
" let g:instant_markdown_autoscroll = 1


" --------------------------------
" plugin: ale
" --------------------------------
" the following lines are intended to generate documentation tags
" automatically

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
