" When the host doesn't have ~/.vim in the runtime path, plugins break.
set rtp+=$HOME/.vim

" Pathogen
let g:pathogen_disabled = []
if !has('python') && !has('python3')
  call add(g:pathogen_disabled, 'ultisnips')
endif

" Ultisnips doesn't work for Vim Python < 2.6
python << endpython
import vim, sys
if sys.version_info < (2, 6):
  vim.command("call add(g:pathogen_disabled, 'ultisnips')")
endpython

" Vim versions lower than 7.0.167 have a bug that prevents this version of Tagbar from working.
if v:version < 700 || v:version == 700 && !has("patch167")
  let g:loaded_tagbar = 1
endif

call pathogen#infect()

" Temporary files
set backupdir=~/.vimtmp/backups
set directory=~/.vimtmp/swaps
if exists("&undodir")
  set undodir=~/.vimtmp/undo
endif

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = ''

let mapleader=","

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
