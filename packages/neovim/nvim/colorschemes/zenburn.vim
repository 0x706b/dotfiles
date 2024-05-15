set background=dark
let g:colors_name="zenburn"

lua package.loaded['zenburn'] = nil

lua << EOF
local lush = require('lush')
local zenburn = require('zenburn')
local spec = lush.extends({ zenburn }).with(function ()
  return {
    LspCodeLens { zenburn.DiagnosticInfo }
  }
end)
lush(spec)
EOF

