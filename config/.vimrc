" =====================================
"             Editing
" =====================================
syntax on

" change leader to space
nnoremap <Space> <Nop>
let mapleader=" "

set tabstop=2                   " number of spaces of each <Tab>
set expandtab                   " use spaces for tab
set shiftwidth=2                " code indentation size of >> and <<

set backspace=indent,eol,start  " enable <BS> to remove autoindent,
                                " end of line character, and start of line

set spell spelllang=en_us       " spell checking
set wrap linebreak              " wrap linebreak
" set columns=80                  " set column width limit
set colorcolumn=80              " set column width (80) marker
set mouse=a                     " add mouse support

" Define command to fill line with = or #
nnoremap <Leader>= 77A=<Esc>d80<bar>
nnoremap <Leader># 77A#<Esc>d80<bar>

" =====================================
"         Search and Replace
" =====================================
" case sensitivity in search
set ignorecase               " case-insensitive in searches with '/'
set smartcase                " case-sensitive distinguish cases
                             " outcome: ignore cases when all letters are
                             "     upper- or lower-case, but do not ignore
                             "     cases for mixed patterns

set incsearch " enable search as you type
set hlsearch  " enable search highlights

" stop highlighting
nnoremap <F3> :noh<CR>


" =====================================
"         Registers
" =====================================
" Markdown
let @t = "bi`\<Esc>ea`\<Esc>"
let @b = "bi**\<Esc>ea**\<Esc>"
let @i = "bi*\<Esc>ea*\<Esc>"
let @u = "o*\<Space>\<Space>\<Space>"
let @o = "o1.\<Space>\<Space>"
let @c = "o```\<CR>```\<Esc>kA"

" =====================================
"         Editor Interface
" =====================================
set number
set relativenumber

" set background and colorscheme
if has('gui_running')
    set background=light
else
    set background=dark
endif

set termguicolors
colorscheme catppuccin_macchiato


" disable audible bell
set noerrorbells visualbell t_vb=


" =====================================
"         Tabs and Windows
" =====================================
" map new tab command
nnoremap <C-n> :tabnew<CR>


" =====================================
"         Key mappings
" =====================================
" Fn mapping:
" F3 no highlight in search result
" F6 source .vimrc
" F7 toggle NERDTree
" F8 toggle tagbar
" F9 open .vimrc in new tab

map <F9> :tabedit $HOME/.vimrc<CR>
map <F6> :so $HOME/.vimrc<CR>

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


" unbind some useless default key bindings
" 'Q' in normal mode enters Ex mode
nmap Q <Nop>


" ===================================================
"         Vim Plug from VimAwesome
" ===================================================
call plug#begin()

" Interface and Integration
Plug 'tpope/vim-fugitive'               " fugitive.vim - a Git wrapper
Plug 'scrooloose/nerdtree'              " nerd tree - tree explorer for vim
Plug 'airblade/vim-gitgutter'           " vim gitgutter - show git diff markers
Plug 'vim-airline/vim-airline'          " vim airline - status/tabline for vim
Plug 'vim-airline/vim-airline-themes'   " vim airline themes
Plug 'altercation/vim-colors-solarized' " vim color theme solarized
Plug 'majutsushi/tagbar'                " tagbar - outline classes, funcs, etc.
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Editing, syntax, linting
"   editing
" Plug 'takac/vim-hardtime'               " stop basic movement keys
Plug 'easymotion/vim-easymotion'        " easymotion - vim motion on speed
Plug 'valloric/youcompleteme'           " youcompleteme - code completion
Plug 'scrooloose/nerdcommenter'         " NERD Commenter
Plug 'junegunn/vim-easy-align'          " Easy align
Plug 'godlygeek/tabular'                " Tabular - text filder and alignment
" Plug 'raimondi/delimitmate'             " delemitmate - auto-completion for
                                        "     quotes, parens, brackes, etc
Plug 'jiangmiao/auto-pairs'

"   visual appearance
Plug 'tpope/vim-surround'               " surroudn.vim - easy pairing
Plug 'nathanaelkane/vim-indent-guides'  " indent guides - visual indent levels
Plug 'plasticboy/vim-markdown'          " markdown syntax - fold levels
Plug 'suan/vim-instant-markdown'        " instant markdown preview

"   syntax
Plug 'scrooloose/syntastic'             " Syntastic - syntax checking
Plug 'mxw/vim-jsx'                      " vim jsx - syntax highlight and indent
Plug 'jelera/vim-javascript-syntax'     " Enhanced JavaScript syntax
Plug 'leafgarland/typescript-vim'       " typescript vim - TypeScript syntax
Plug 'cespare/vim-toml'                 " vim-toml - vim syntax for toml

"   fixing/linting
Plug 'w0rp/ale'                         " async lint engine - syntax checking
Plug 'prettier/vim-prettier'            " vim prettier
Plug 'bronson/vim-trailing-whitespace'  " trailing whitespace in red
Plug 'editorconfig/editorconfig-vim'    " vim support for .editorconfig

" Search
Plug 'mileszs/ack.vim'                  " ack - vim plugin for ack
" ctrlp installed by 'ctrlpvim/ctrlp.vim' or manually by setUpVim.sh

" Other
Plug 'wakatime/vim-wakatime'            " wakatime dev stats


" vim-plug commands:
" PlugInstall
" PlugUpdate
" PlugClean
" PlugUpgrade  -- upgrade vim plug itself
" PlugStatus
" PlugDiff

call plug#end()

" ===================================================
"          plugin configuration
" ===================================================

" --------------------------------
" plugin: NERDTree
" --------------------------------
nmap <F7> :NERDTreeToggle<CR>

" --------------------------------
" plugin: tag
" --------------------------------
nmap <F8> :TagbarToggle<CR>

" --------------------------------
" plugin: vim-indent-guides
" --------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesEven ctermbg=darkgrey

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
" let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0

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
" plugin: NERDCommenter
" --------------------------------
let g:NERDSpaceDelims = 1

" --------------------------------
" plugin: ctrlp
" --------------------------------
let g:ctrl_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'

" --------------------------------
" plugin: vim-airlines
" --------------------------------
" list of themes: https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme = 'catppuccin_mocha'
let g:airline_solarized_bg='dark'
let g:airline_section_z = "%p%% : \ue0a1:%l/%L: Col:%c"
let g:airline_section_z = "%p%% ☰ %l/%L: %c"
let g:airline_extensions = []

" --------------------------------
" plugin: vim-hardtime
" --------------------------------
let g:hardtime_default_on = 1

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
