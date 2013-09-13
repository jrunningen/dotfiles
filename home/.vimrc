" When the host doesn't have ~/.vim in the runtime path, plugins break.
set rtp+=$HOME/.vim

" Pathogen
let g:pathogen_disabled = []
if !has('python') && !has('python3')
	call add(g:pathogen_disabled, 'ultisnips')
endif

" CSApprox turns vim white when running in the terminal.  Don't know why.
if !has("gui") 
    let g:CSApprox_loaded = 1
endif

" Vim versions lower than 7.0.167 have a bug that prevents this version of Tagbar from working.
if v:version < 700 || v:version == 700 && !has("patch167")
    let g:loaded_tagbar = 1
endif

call pathogen#infect()

" Temporary files
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Coloring
filetype plugin indent on
syntax on
color default

set nocompatible                    " Make vim more useful
set history=1000                    " Store lots of :cmdline history
set list listchars=tab:\ \ ,trail:⋅ " Display trailing spaces
set wildmode=list:longest           " Make cmdline tab completion similar to bash
set wildmenu                        " Enable ctrl-n and ctrl-p to scroll through matches
set wildignore=*.o,*.obj,*~         " Stuff to ignore when tab completing
set esckeys                         " Allow cursor keys in insert mode
set ttyfast                         " Optimize for fast terminal connections
set encoding=utf-8 nobomb           " Use UTF-8 without BOM
set cursorline                      " Highlight current line
set incsearch                       " Find the next match as we type the search
set hlsearch                        " Highlight searches by default
set ignorecase smartcase            " Ignore case of lower-case searches
set laststatus=2                    " Always show status line
set mouse=a                         " Enable mouse in all modes
set ttymouse=xterm2
set t_Co=256                        " Tell the term has 256 colors
set noerrorbells                    " Disable error bells
set nostartofline                   " Don’t reset cursor to start of line when moving around.
set ruler                           " Show the cursor position
set shortmess=atIo                  " Don’t show the intro message when starting vim
set showmode                        " Show the current mode
set title                           " Show the filename in the window titlebar
set scrolloff=3                     " Vertical/horizontal scroll off settings
set sidescrolloff=7
set sidescroll=1
set tags=tags;/                     " Search recursively upward for the ctags file.
set exrc secure                     " Use project-specific .vimrc files.
set background=dark                 " I use a dark background most of the time.
set linebreak                       " Wrap text at word boundaries.
set backspace=indent,start          " Backspace behavior that seems natural to me.
set textwidth=80                    " Wrap text at 80 characters.
set magic                           " Fewer backslashes in my regexes.
set shiftround

let g:airline_left_sep=''
let g:airline_right_sep=''

nnoremap <silent> <F1>  :BufExplorer<CR>
nnoremap <silent> <F2>  :NERDTreeToggle<CR>
nnoremap <silent> <F9>  :TagbarToggle<CR>
nnoremap <silent> <F11> :YRShow<CR>

"make Y consistent with C and D
nnoremap Y y$

" Easier window jumping
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

let mapleader=","

" Open the quickfix window at full screen width, even when Tagbar is open
nnoremap <leader>q :botright cwindow<CR>
nnoremap <leader>Q :cclose<CR>

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" Syntax highlighting for Protocol Buffers
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" Don't let UltiSnips steal the keybinding for digraph inputs.
augroup VimStartup
	au!
	au VimEnter * sil! iunmap <C-K>
augroup end

" From http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
" Delete fugitive buffers when we leave them - otherwise the buffer list gets poluted.
autocmd BufReadPost fugitive://* set bufhidden=delete
" View the parent tree with ..
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Enable spellcheck for git commit messages
au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

nnoremap <leader>gg :Ggrep <cword><CR>
nnoremap <leader>ww :Ack <cword><CR>

" Fugitive bindings
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>

" Automatic updates when editing vimdiffs
vnoremap <leader>dp :diffput<CR> \| :diffupdate<CR>
vnoremap <leader>do :diffget<CR> \| :diffupdate<CR>

nnoremap <leader>e :Errors<CR>

nnoremap <leader>gt :NERDTreeFind<CR>
