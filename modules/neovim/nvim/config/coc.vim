"coc extensions
let g:coc_global_extensions = [
\  'coc-tsserver',
\  'coc-emmet',
\  'coc-css',
\  'coc-html',
\  'coc-json',
\  'coc-yank',
\  'coc-rls',
\  'coc-python',
\  'coc-snippets',
\  'coc-highlight',
\  'coc-lists',
\  'coc-explorer',
\  'coc-eslint',
\  '@0x706b/coc-prettier'
\  ]

let g:coc_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nmap <silent> <leader>xx :<C-u>CocFzfList diagnostics --current-buf<CR>
nmap <silent> <leader>xc :<C-u>CocFzfList commands<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd CursorHoldI * sil call CocActionAsync('showSignatureHelp')

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nmap <leader>p  <Plug>(coc-codeaction-line)
nmap <leader>r  <Plug>(coc-rename)
imap <silent><c-space> call CocActionAsync('showSignatureHelp')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ CheckBackSpace() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

let g:coc_snippet_next = "<TAB>"

imap <expr> <CR> coc#pum#visible() ?
    \ "\<C-y>" :
    \ delimitMate#WithinEmptyPair() ?
    \ "\<Plug>delimitMateCR" :
    \ "\<CR>"


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <silent><leader>ee :CocCommand explorer --position floating --floating-width 100 --floating-height 30 --quit-on-open<CR>
nmap <silent><leader>el :CocCommand explorer --position left<CR>
nmap <silent><leader>er :CocCommand explorer --position right<CR>

nmap <leader><leader>l :call CocAction('toggleExtension', 'coc-eslint')<CR>
nmap <leader><leader>f :call CocAction('format')<CR>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
