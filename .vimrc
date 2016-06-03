set encoding=UTF-8

set nocompatible
set ruler

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist

"disable visual bell
set visualbell t_vb=

"indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set expandtab
" set autoindent

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"display tabs and trailing spaces
" set list
"set listchars=tab:\ \ ,extends:>,precedes:<
" disabling list because it interferes with soft wrap

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden
"mostrar o parenteses
set sm

""""""""""""""""""""""""""Plugins"""""""""""""""""""""""""

" Pathogen
call pathogen#infect()
runtime bundle/vim-pathogen/autoload/pathogen.vim

" molokai
syntax enable
set background=dark
colorscheme molokai

" Add ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" TagBar
nmap <F8> :TagbarToggle<CR>

"map to NERDTree
nmap <silent> <Leader>p :NERDTreeToggle<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"ack for grep
set grepprg=ack
set grepformat=%f:%l:%m
