lua << EOF
require("mellifluous").setup({
  color_set = 'mellifluous',
  highlight_overrides = {
    dark = function(hl, colors)
      hl.set("DiagnosticUnderlineError", { undercurl = true, sp = hl.get("DiagnosticError").fg })
      hl.set("DiagnosticUnderlineWarn",  { undercurl = true, sp = hl.get("DiagnosticWarn").fg })
      hl.set("DiagnosticUnderlineHint",  { undercurl = true, sp = hl.get("DiagnosticHint").fg })
      hl.set("DiagnosticUnderlineInfo",  { undercurl = true, sp = hl.get("DiagnosticInfo").fg })
    end
  }
})
EOF

colorscheme mellifluous
