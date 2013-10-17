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
