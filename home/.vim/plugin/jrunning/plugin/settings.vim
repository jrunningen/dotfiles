set nocompatible                    " Make vim more useful
set list listchars=tab:\ \ ,trail:⋅ " Display trailing spaces
set wildmode=list:longest           " Make cmdline tab completion similar to bash
set wildignore=*.o,*.obj,*~         " Stuff to ignore when tab completing
set esckeys                         " Allow cursor keys in insert mode
set ttyfast                         " Optimize for fast terminal connections
set encoding=utf-8 nobomb           " Use UTF-8 without BOM
set hlsearch                        " Highlight searches by default
set ignorecase smartcase            " Ignore case of lower-case searches
set mouse=a                         " Enable mouse in all modes
set ttymouse=xterm2
set t_Co=256                        " Tell the term has 256 colors
set noerrorbells                    " Disable error bells
set nostartofline                   " Don’t reset cursor to start of line when moving around.
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
set nowrap                          " ... but only if I explicitly turn wrapping on.
set magic                           " Fewer backslashes in my regexes.
set colorcolumn=+1                  " Highlight at textwidth (should be 80)
set number
set smartindent
set ruler
