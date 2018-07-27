"Init plug"
call plug#begin('~/.config/nvim/plugged')

"Plugins"
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'mileszs/ack.vim'
Plug 'numkil/ag.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'

"Python plugins"
Plug 'vim-scripts/indentpython.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'


"End plug"
call plug#end()

filetype plugin indent on

"Python settings"
let python_highlight_all=1
syntax on
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


"YouCompleteMe"
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Flag Whitespace"
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"UTF-8"
set encoding=utf-8


"ack"
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"Nerdtree"
"autocmd vimenter * NERDTree"
map <C-n> :NERDTreeToggle<CR>

"ctrlp"
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"Color Settings"

"General Settings"
set autoindent                  " Automatically indent
set autoread                    " Automatically read changed files
set number
set relativenumber
"set background=dark             " Dark background
set cindent                     " C syntax formatting
set clipboard=unnamed           " yank and paste with the system clipboard
set cursorline
set expandtab                   " Use spaces instead of tabs
set foldenable                  " Enable folding
set foldlevelstart=10           " Open most folds be default
set foldnestmax=10              " 10 nested fold max
set foldmethod=marker           " Collapse marker folds
set formatoptions=qroct         " see :help fo-table for info
set hlsearch                    " Highlight search matches
set ignorecase                  " Ignore search case...
set incsearch                   " Search as chars are entered
set lazyredraw                  " Redraw only when needed"
set smartcase                   " ... unless search contains caps
set incsearch                   " Incremental search
set nojoinspaces                " Don't insert double spaces after a period when using gq
set nocompatible                " Don't start in vi compatibility mode
"set nopaste                     " Don't paste, we want normal insert mode
set ruler                       " Show postion of pointer
set scrolloff=3                 " show context above/below cursorline
set shiftwidth=4                " 4 spaces tabbing
set showcmd                     " Show command
set showmatch                   " Highlight matching
set showmode                    " Show mode in search
set smartindent                 " In a smarty way
set softtabstop=4               " 4 spaces tabbing
set splitright                  " splitting a window will put it to the right
set tabstop=4                   " 4 spaces tabbing
set ttyfast                     " Fast, nice updating
set wildignore=log/**,dist/**,tmp/**,.tmp/**
set wildmenu                    " show a navigable menu for tab completion
set wildmode=longest,list,full
syntax enable                   " highlight syntax

" Unlimited persistent undo: "
set undofile
set undodir=~/.config/nvim/undo

" Backup settings: "
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Keybindings "
" Open folds
nnoremap <space> za
" Highlight latest inserted text
nnoremap gV `[v`]
" Jump to end of last word
nnoremap <S-e> ge
" Save session - open with nvim -S
nnoremap <leader>s : mksession<CR>
" open AG
nnoremap <leader>a :Ag


" Leader
let mapleader=","



" Rebalance Windows "
autocmd VimResized * :wincmd = 



