call plug#begin('~/.vim/plugged')
   " Movement
   Plug 'tpope/vim-repeat'
   Plug 'easymotion/vim-easymotion', { 'branch': 'master' }
   Plug 'haya14busa/incsearch.vim'
   Plug 'haya14busa/incsearch-fuzzy.vim'
   Plug 'haya14busa/incsearch-easymotion.vim'

   Plug '~/.vim/plugged/primer.vim'
   Plug '~/.vim/plugged/japan.vim'

   " Airline
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'

   " Git
   Plug 'tpope/vim-fugitive'

   Plug 'tpope/vim-sleuth'

   " Themes
   Plug '0x706b/proton'
   Plug 'lifepillar/vim-solarized8'
   Plug 'junegunn/seoul256.vim'
   Plug 'AlessandroYorba/Sierra'
   Plug 'arzg/vim-colors-xcode'
   Plug 'cormacrelf/vim-colors-github'
   Plug 'danilo-augusto/vim-afterglow'
   Plug 'sainnhe/everforest'

   " zsh
   Plug 'chrisbra/vim-zsh'

   " Typescript/Javascript
   Plug 'HerringtonDarkholme/yats.vim'
   Plug 'othree/yajs.vim'
   Plug 'Quramy/vim-js-pretty-template'

   " graphql
   Plug 'jparise/vim-graphql'

   "postgres
   Plug 'tpope/vim-dadbod'
   Plug 'lifepillar/pgsql.vim'

   " coc
   Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }

   "coc extensions
   let g:coc_global_extensions = [
   \  'coc-tsserver',
   \  'coc-emmet',
   \  'coc-css',
   \  'coc-html',
   \  'coc-json',
   \  'coc-yank',
   \  'coc-prettier',
   \  'coc-eslint',
   \  'coc-rls',
   \  'coc-python',
   \  'coc-snippets',
   \  'coc-highlight',
   \  'coc-lists',
   \  'coc-explorer',
\  ]

   " python
   Plug 'vim-python/python-syntax'

   " rust
   Plug 'rust-lang/rust.vim'

   " haskell
   Plug 'neovimhaskell/haskell-vim'
   Plug 'monkoose/fzf-hoogle.vim'
   Plug 'aiya000/vim-ghcid-quickfix'

   " fzf
   Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
   Plug 'junegunn/fzf.vim'

   Plug 'antoinemadec/coc-fzf'

   " codi
   Plug 'metakirby5/codi.vim'

   " Misc
   Plug 'Raimondi/delimitMate'
   Plug 'Yggdroot/indentLine'
   Plug 'preservim/nerdcommenter'
   Plug 'ryanoasis/vim-devicons'
   Plug 'tpope/vim-surround'
   " Plug 'markstory/vim-zoomwin'
   Plug 'terryma/vim-multiple-cursors'
   Plug 'jdhao/better-escape.vim'
   Plug 'justinmk/vim-syntax-extra'

   " C/C++
   Plug 'rhysd/vim-clang-format'
   Plug 'bfrg/vim-cpp-modern'
   Plug 'jackguo380/vim-lsp-cxx-highlight'

   " Scala
   Plug 'derekwyatt/vim-scala'


   Plug 'Lokaltog/vim-monotone'

call plug#end()

