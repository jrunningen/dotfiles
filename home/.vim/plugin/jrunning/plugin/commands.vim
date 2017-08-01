" For editing prose with long lines.
command! -nargs=0 Prose
      \ set wrap linebreak nolist textwidth=0
      \ | execute 'nnoremap k gk'
      \ | execute 'nnoremap j gj'
      \ | execute 'vnoremap k gk'
      \ | execute 'vnoremap j gj'
