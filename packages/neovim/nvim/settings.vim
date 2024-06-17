set termguicolors
set noshowmode
set wildmenu
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set nohlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set number relativenumber
set backspace=2
set hidden
let mapleader = "\<Space>"

set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

""" Disable quote conceal in JSON files
autocmd Filetype json let g:indentLine_setConceal = 0
let g:vim_json_syntax_conceal = 0

""" Shortcut to find which syntax groups a term is assigned to
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists('*synstack')
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescriptreact
autocmd FileType typescript JsPreTmpl

" Highlighted Yank
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank { higroup='Search', timeout=500 }
augroup END

