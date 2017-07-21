let mapleader=","

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tomasr/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-ragtag'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/LargeFile'
Plug 'tpope/vim-abolish'
Plug 'bling/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'dahu/LearnVim'
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'ap/vim-css-color'
Plug 'Lokaltog/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-dispatch'
Plug 'elzr/vim-json'
Plug 'sh-dude/ZoomWin'
Plug 'vim-scripts/argtextobj.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" FIXME: Use personal settings.
syntax on
set bg=dark

" Vim versions lower than 7.0.167 have a bug that prevents this version of Tagbar from working.
if v:version < 700 || v:version == 700 && !has("patch167")
  let g:loaded_tagbar = 1
endif

"if v:version < 702
"  call janus#disable_plugin('zoomwin')
"endif

let g:UltiSnipsExpandTrigger="<leader>a"
let g:UltiSnipsJumpForwardTrigger="<leader>a"
let g:UltiSnipsJumpBackwardTrigger="<leader><z>"

"call janus#disable_plugin('syntastic')
"call janus#disable_plugin('ultisnips')
"call janus#disable_plugin('vroom')
"call janus#disable_plugin('supertab')

let work_vimrc = expand('~/.vimrc.work')
if filereadable(work_vimrc)
  exec "source " . work_vimrc
endif

" Temporary files
set backupdir=~/.vimtmp/backups
set directory=~/.vimtmp/swaps//,.
if exists("&undodir")
  set undodir=~/.vimtmp/undo
endif

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = ''

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
" Delete fugitive buffers when we leave them - otherwise the buffer list gets polluted.
autocmd BufReadPost fugitive://* set bufhidden=delete
" View the parent tree with ..
autocmd BufReadPost fugitive://*
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif

let g:syntastic_cpp_compiler_options = ' -std=c++11'

" For editing prose with long lines.
command! -nargs=0 Prose
      \ set wrap linebreak nolist textwidth=0
      \ | execute 'nnoremap k gk'
      \ | execute 'nnoremap j gj'
      \ | execute 'vnoremap k gk'
      \ | execute 'vnoremap j gj'

color molokai

" I like the molokai colorscheme, but jellybeans has better vimdiff
" highlighting, so here's the highlight groups from jellybeans for diffs.
hi DiffAdd term=bold ctermfg=193 ctermbg=22 guifg=#D2EBBE guibg=#437019
hi DiffDelete term=bold ctermfg=16 ctermbg=52 guifg=#40000A guibg=#700009
hi DiffChange term=bold ctermbg=24 guibg=#2B5B77
hi DiffText term=reverse cterm=reverse ctermfg=81 ctermbg=16 gui=reverse guifg=#8fbfdc guibg=#000000

" Use a soft gray for the colorcolumn at 80 characters
highlight ColorColumn ctermbg=232

autocmd FileType go setlocal tabstop=2
