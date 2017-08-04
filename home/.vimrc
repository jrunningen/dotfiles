let mapleader=","

set nocompatible

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dahu/LearnVim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/vim-plug'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sh-dude/ZoomWin'
Plug 'sjl/gundo.vim'
Plug 'tomasr/molokai'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-syntastic/syntastic'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Source work .vimrc, if it exists.
let work_vimrc = expand('~/.vimrc.work')
if filereadable(work_vimrc)
  exec "source " . work_vimrc
endif
