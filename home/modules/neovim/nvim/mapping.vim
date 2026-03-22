" =)
nnoremap = :
" Ableton live buffer switching
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
" Easy vertical split
nnoremap <leader>' :vs<CR>

" Easily escape
" inoremap jj <ESC>
" Tab-like buffer behavior with control-c
nnoremap <silent> <C-c> :bp\|bd #<CR>

nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>j :wincmd j<CR>

map <A-l> $
map <A-h> 0
map <A-j> %

nnoremap <A-o> o<ESC>ko<CR>
