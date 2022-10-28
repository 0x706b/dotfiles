set background=dark
let g:solarized_termtrans = 1
let g:solarized_statusline = 'flat'
let g:solarized_extra_hi_groups = 1

function! s:solarized_custom()
  hi CocErrorHighlight guifg=NONE guibg=NONE guisp=#dc322f gui=undercurl
  hi CocWarningHighlight guifg=NONE guibg=NONE guisp=#b58900 gui=undercurl
  hi CocInfoHighlight guifg=NONE guibg=NONE guisp=#2aa198 gui=undercurl

  hi! link typescriptTypeReference Type
  hi! link typescriptTypeParameter Type
  hi! link typescriptArrowFunc Statement
  hi! link typescriptParens Special
  hi! link typescriptBraces Special
endfunction

colorscheme solarized8

autocmd BufEnter * call s:solarized_custom()
