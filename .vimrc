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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

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
" set ttymouse=xterm2

"hide buffers when not displayed
set hidden
"mostrar o parenteses
set sm

" molokai
syntax enable
set background=dark
colorscheme molokai

" TagBar
nmap <F8> :TagbarToggle<CR>

"map to NERDTree
nmap <silent> <Leader>p :NERDTreeToggle<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'altercation/vim-colors-solarized'

" Awesome looking meta at bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/syntastic'

Plug 'vim-scripts/tComment' "Comment easily with gcc

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'
Plug 'leafgarland/typescript-vim'

Plug 'valloric/youcompleteme'

Plug 'mileszs/ack.vim'

Plug 'mattn/emmet-vim'

Plug 'pangloss/vim-javascript'

Plug 'majutsushi/tagbar'

Plug 'raimondi/delimitmate'

Plug 'ternjs/tern_for_vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'godlygeek/tabular'

Plug 'will133/vim-dirdiff'

Plug 'mxw/vim-jsx'

Plug 'epilande/vim-react-snippets'

Plug 'epilande/vim-es2015-snippets'

call plug#end()
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" [1]
" Color scheme
syntax enable
" let g:solarized_termcolors=16
let g:solarized_termcolors=256
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
let g:colarized_termtrans = 1

" set background=dark
" colorscheme solarized
" Allow powerline symbols to show up
let g:airline_powerline_fonts = 1

" [2]
map <silent> <C-n> :NERDTreeToggle<cr>
nnoremap <C-t> :call ToggleRelativeOn()<cr>
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:airline_powerline_fonts = 1

set clipboard=unnamedplus

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_javascript_checkers = ['eslint', 'jshint']

let g:python3_host_prog = '/usr/local/bin/python3'

let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,node_modules/*"
let g:DirDiffIgnore   = "node_modules"

" set autochdir
set ignorecase

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
