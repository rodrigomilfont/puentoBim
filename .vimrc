set encoding=UTF-8

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible
set ruler
"allow backspacing over everything in insert mode
set backspace=indent,eol,start
"store lots of :cmdline history
set history=1000
"show incomplete cmds down the bottom
set showcmd     
"show current mode down the bottom
set showmode    
"find the next match as we type the search
set incsearch   
"hilight searches by default
set hlsearch   
"add line numbers
set number      
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
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
:set ignorecase
:set smartcase
"some stuff to get the mouse going in term
set mouse=a
"hide buffers when not displayed
set hidden
set sm

"turn on syntax highlighting
syntax on

" molokai
syntax enable
set background=dark
colorscheme molokai

"map to NERDTree
nmap <silent> <Leader>p :NERDTreeToggle<CR>

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript.jsx,vue EmmetInstall

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
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
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:colarized_termtrans = 1
" colorscheme solarized
" Allow powerline symbols to show up
let g:airline_powerline_fonts = 1

" [2]
map <silent> <C-n> :NERDTreeToggle<cr>
nnoremap <C-t> :call ToggleRelativeOn()<cr>
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:airline_powerline_fonts = 1

set clipboard=unnamed

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

let g:python3_host_prog = '/usr/local/bin/python3'

let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,node_modules/*"
let g:DirDiffIgnore   = "node_modules"

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

let g:ackprg = 'ag --nogroup --nocolor --column --ignore=node_modules'

" W/ale
" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['eslint']
\}
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)

let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1


" PRETTIER
let g:prettier#autoformat = 0
autocmd BufWritePre *.vue,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.test.js,*.test.jsx PrettierAsync

let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#semi = 'false'
let g:prettier#config#print_width = 80
let g:prettier#config#single_quote = 'true'
let g:prettier#config#parser = 'babylon'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_user_command =
      \ 'ag %s --files-with-matches -g ""  --hidden --ignore=.git'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'altercation/vim-colors-solarized'

" Awesome looking meta at bottom
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'vim-scripts/tComment' "Comment easily with gcc

" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'

" React code snippets
Plug 'epilande/vim-react-snippets'

" Ultisnips
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'
Plug 'leafgarland/typescript-vim'

Plug 'valloric/youcompleteme'

Plug 'mileszs/ack.vim'

Plug 'mattn/emmet-vim'

Plug 'pangloss/vim-javascript'

Plug 'majutsushi/tagbar'

Plug 'raimondi/delimitmate'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'

Plug 'godlygeek/tabular'

Plug 'will133/vim-dirdiff'

Plug 'mxw/vim-jsx'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'w0rp/ale'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'editorconfig/editorconfig-vim'

Plug 'posva/vim-vue'

Plug 'mattn/emmet-vim'

Plug 'digitaltoad/vim-pug'

call plug#end()
