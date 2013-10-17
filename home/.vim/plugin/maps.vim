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

" Strip trailing whitespace
function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" Open the quickfix window at full screen width, even when Tagbar is open
nnoremap <leader>q :botright cwindow<CR>
nnoremap <leader>Q :cclose<CR>

" Project searching
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
