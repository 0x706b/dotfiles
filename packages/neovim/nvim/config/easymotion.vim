let g:EasyMotion_do_mapping = 0
let g:EasyMotion_prompt = '{n}>>> '

map <leader>f <Plug>(easymotion-bd-f2)
nmap <leader>f <Plug>(easymotion-overwin-f2)
map s <Plug>(easymotion-s2)
nmap ; <Plug>(easymotion-next)
nmap , <Plug>(easymotion-prev)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <leader>s incsearch#go(<SID>config_easyfuzzymotion())
