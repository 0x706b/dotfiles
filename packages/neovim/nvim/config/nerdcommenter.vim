let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCreateDefaultMappings = 0

vnoremap <silent><leader>/ :<c-u>call SexyComment()<CR>

func! SexyComment()
   call nerdcommenter#SetUp()
   let line_start = getpos("'<")[1]
   let line_end = getpos("'>")[1]
   let is_start_commented = nerdcommenter#IsLineCommented(line_start)
   let is_end_commented = nerdcommenter#IsLineCommented(line_end)
   if is_start_commented && is_end_commented
      call nerdcommenter#Comment('x', 'uncomment')
   elseif is_start_commented || is_end_commented
      call nerdcommenter#Comment('x', 'uncomment')
   else
      call nerdcommenter#Comment('x', 'sexy')
   endif
endfunc

