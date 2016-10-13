" This must be first, because it changes other options as side effect
set nocompatible
filetype off
filetype plugin off

filetype plugin indent on
set hidden

set t_Co=256
set background=dark
set shortmess=atI

syntax on
syntax sync fromstart

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Visuals
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.git
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set scrolloff=5

" Terminal
set showcmd
set mouse=a
set laststatus=2
set statusline=%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ L#:\ %l/%L:%c\ \ FT:%Y\ \ %P\ \ 
set report=0
set ch=1

function! CurDir()
	let curdir = substitute(getcwd(), '/home/troy/', "~/", "g")
		return curdir
endfunction


" Backups are for pussies. Use version control
set nobackup
set noswapfile
set noautowrite
set noautowriteall
set autoread

filetype plugin indent on

autocmd filetype python set expandtab


" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> ,/ :nohlsearch<CR>

autocmd FileType python inoremap ; :

" key bindings
nnoremap ; :

inoremap jj <ESC>

nnoremap Y y$

" Bindings for scrolling 10 lines at a time
nnoremap [ 10j
nnoremap ] 10k

" create a new tab
map :tc :tabnew %<cr>
" close a tab
map :td :tabclose<cr>

" Insert timestamp on next line
map <F5> :r!date<CR>

" Bindings for code folding
nnoremap zz zO
nnoremap Zz zM
nnoremap zZ zR

" Yank to system clipboard
map <Leader>y "+y"
