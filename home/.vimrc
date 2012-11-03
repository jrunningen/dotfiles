" When the host doesn't have ~/.vim in the runtime path, plugins break.
set rtp+=$HOME/.vim 

" Install pathogen
call pathogen#infect()

" Make vim more useful
set nocompatible

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Store lots of :cmdline history
set history=1000

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
" set gdefault
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

" Make tabs as wide as two spaces
set tabstop=2
set shiftwidth=2

" Highlight searches
set hlsearch

" Ignore case of lower-case searches
set ignorecase smartcase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

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

" Start scrolling three lines before the horizontal window border
set scrolloff=3

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
