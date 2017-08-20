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

" Turn on status line
set laststatus=2
set showtabline=2

" Command-T
let g:CommandTWildIgnore=&wildignore . ",*/Godeps"

" NERDTree
let NERDTreeMapActivateNode='<right>'
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
let NERDTreeQuitOnOpen=1

" Git Gutter
let g:gitgutter_sign_column_always=1

" Lightline / bufferline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number  = 1

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" Go Vim
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
let g:neocomplete#enable_auto_select = 1
if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns = {}
        endif
        let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'
if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
  endif
let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
