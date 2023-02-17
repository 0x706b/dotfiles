set background=dark
let g:colors_name="zenburn"

lua package.loaded['zenburn'] = nil

lua require('lush')(require('zenburn'))
