" Plugin manager
execute pathogen#infect()

filetype on
syntax on
colorscheme Tomorrow-Night-Bright

set guifont=Menlo\ Regular:h30

set colorcolumn=90
set number

set hidden
set history=100

set tabstop=4
filetype indent on
filetype plugin on
set nowrap
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Search terms are highlighted
set hlsearch

" Incremental search
set incsearch

" Cancel search on ESC
nnoremap <silent> <leader>/ :nohlsearch <cr>

" Map \\ to Open Previous File
nnoremap <Leader><Leader> :e#<CR>

" Show matching parens
set showmatch

" Ignore case when searching
set ignorecase

" Other stuff
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Don't use backup file
set nobackup
set noswapfile

" Different file types
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
