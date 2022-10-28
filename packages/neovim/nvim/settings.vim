set termguicolors
set noshowmode
set wildmenu
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set ttyfast
" set lazyredraw
set nohlsearch
set tabstop=2
set shiftwidth=2
" set autoindent
" set smartindent
set expandtab
set mouse=a
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set number relativenumber
set backspace=2
set hidden
" set autowrite
let mapleader = "\<Space>"

" filetype plugin indent on

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
" autocmd FileType typescript JsPreTmpl

" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" autocmd BufEnter * source /Users/peter/.config/nvim/colorschemes/setcolors.vim
