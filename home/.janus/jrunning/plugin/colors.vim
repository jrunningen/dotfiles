syntax on

" The Jellybeans colorscheme uses a different background with SpecialKey.
" With my listchar settings, this produces highlighted tabs, which looks weird.
" So clear the SpecialKey setting.
autocmd BufEnter * :highlight clear SpecialKey

" When highlighting search terms, make sure text is contrasting color.
" Idea from http://superuser.com/a/224862
autocmd BufEnter * :highlight Search ctermbg=yellow ctermfg=black
