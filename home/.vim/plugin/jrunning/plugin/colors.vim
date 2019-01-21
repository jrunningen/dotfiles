if has('win32')
	color industry " molokai looks awful in terminal Vim in the Windows console.
else
	color molokai
endif

function s:ColorTweaks()
  " Dark, subtle cursorcolumn.
  highlight ColorColumn ctermbg=232 guibg=#000000

  " When highlighting search terms, make sure text is contrasting color.
  " Idea from http://superuser.com/a/224862
  highlight Search ctermbg=yellow ctermfg=black

  " I like the molokai colorscheme, but jellybeans has better vimdiff
  " highlighting, so here's the highlight groups from jellybeans for diffs.
  highlight DiffAdd term=bold ctermfg=193 ctermbg=22 guifg=#D2EBBE guibg=#437019
  highlight DiffDelete term=bold ctermfg=16 ctermbg=52 guifg=#40000A guibg=#700009
  highlight DiffChange term=bold ctermbg=24 guibg=#2B5B77
  highlight DiffText term=reverse cterm=reverse ctermfg=81 ctermbg=16 gui=reverse guifg=#8fbfdc guibg=#000000
endfunction

" Call this with an autocmd, because it doesn't seem to take efect when I just
" call the highlight commands directly from this file.
autocmd VimEnter * call s:ColorTweaks()
