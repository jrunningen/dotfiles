" This should work on both Linux and Windows. Old versions of git on Windows
" have trouble with symlinks, so to be safe, this file sources plug.vim
" instead of using a symlink.

let g:plugpath = expand('<sfile>:h') . '/../vim-plug/plug.vim'
execute 'source ' . g:plugpath
