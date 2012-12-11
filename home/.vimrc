" When the host doesn't have ~/.vim in the runtime path, plugins break.
set rtp+=$HOME/.vim

" Disable pathogen plugins when appropriate.
let g:pathogen_disabled = []
if !has('python') && !has('python3')
	call add(g:pathogen_disabled, 'ultisnips')
endif

call pathogen#infect()

" Make vim more useful
set nocompatible

" Store lots of :cmdline history
set history=1000

" Display trailing spaces
set list
set listchars=tab:\ \ ,trail:⋅

set wildmode=list:longest   " Make cmdline tab completion similar to bash
set wildmenu                " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ " Stuff to ignore when tab completing

" Allow cursor keys in insert mode
set esckeys

" Optimize for fast terminal connections
set ttyfast

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

set incsearch   " Find the next match as we type the search
set hlsearch    " Highlight searches by default

" Ignore case of lower-case searches
set ignorecase smartcase

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a
set ttymouse=xterm2

"tell the term has 256 colors
set t_Co=256

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting vim
set shortmess=atIo

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" Use auto-indent.
set ai

" Turn on everything with filetypes.
filetype plugin indent on

" Search recursively upward for the ctags file.
set tags=tags;/

" Use project-specific .vimrc files.
set exrc secure

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" Ignore whatever silly colorscheme the local sysadmin likes.
color default

" I use a dark background most of the time.
set background=dark

" Wrap text at word boundaries.
set linebreak

" Make powerline look nice.
let g:Powerline_symbols = 'fancy'

" Backspace behavior that seems natural to me.
set backspace=indent,start
" Wrap text at 80 characters.
set textwidth=80

" Open TagBar.
nnoremap <silent> <F9> :TagbarToggle<CR>

" Open NERDTree.
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" Magic regexes.
set magic

" Easier window jumping
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
