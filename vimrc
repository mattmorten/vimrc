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

" Remap leader
:let mapleader = " "

" Cancel search on ESC
nnoremap <silent> <leader>/ :nohlsearch <cr>

" Map \\ to Open Previous File
nnoremap <Leader>l :e#<CR>

" Show matching parens
set showmatch

" Ignore case when searching
set ignorecase

" Press enter to clear the search highlighting
nnoremap <CR> :noh<CR><CR>

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
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" Turn on status line
set laststatus=2
set showtabline=2

"Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 35
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Command-T
let g:CommandTWildIgnore=&wildignore . ",*/Godeps"

" NERDTree
nmap <Leader>n :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"

" Git Gutter
set signcolumn=yes

" Lightline / bufferline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number  = 2

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

" Go window setup
nnoremap <Leader><Leader> :TagbarOpen<CR>:NERDTreeFind<CR><C-W>w<C-W>w

"Snippets
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Here is the keyboard shortcut so that closing a buffer doesn't screw up the
" IDE
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Go-specific key remaps
 au FileType go nmap <Leader>i <Plug>(go-info)
 au FileType go nmap <Leader>gd <Plug>(go-doc)
 au FileType go nmap <Leader>r <Plug>(go-run)
 au FileType go nmap <Leader>b <Plug>(go-build)
 au FileType go nmap <Leader>gt <Plug>(go-test)
 au FileType go nmap <Leader>l <Plug>(go-lint)
 au FileType go nmap gd <Plug>(go-def-tab)

" Go Vim
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 0
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

"Grep
"nnoremap <Leader>f :vimgrep /<C-R><C-W>/ *<CR>:cw<CR>
:map <Leader>f :execute "vimgrep /" . expand("<cword>") . "/j **/*.go"<Bar>cw<CR>

" Tagbar
let g:tagbar_left = 1
let g:tagbar_width = 35
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

"Quickfix always to the bottom
"" put quickfix window always to the bottom
autocmd FileType qf wincmd J
