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

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'altercation/vim-colors-solarized'
Plug 'endel/vim-github-colorscheme'
" Fugitive will help with git related stuff, and show branch on statusline
Plug 'tpope/vim-fugitive'
" Awesome looking meta at bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/tComment' "Comment easily with gcc
" Add plugins to &runtimepath
call plug#end()

" [1]
" Color scheme
syntax enable
" let g:solarized_termcolors=16
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:colarized_termtrans = 1
set background=dark
colorscheme solarized
" Allow powerline symbols to show up
let g:airline_powerline_fonts = 1

" [2]
map <silent> <C-n> :NERDTreeToggle<cr>
nnoremap <C-t> :call ToggleRelativeOn()<cr>
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:airline_powerline_fonts = 1

