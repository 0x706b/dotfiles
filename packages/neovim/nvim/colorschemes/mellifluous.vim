lua << EOF
require("mellifluous").setup({
  color_set = 'mellifluous',
  plugins = {
    treesitter = true
  },
  highlight_overrides = {
    dark = function(hl, colors)
      hl.set("DiagnosticUnderlineError", { undercurl = true, sp = hl.get("DiagnosticError").fg })
      hl.set("DiagnosticUnderlineWarn",  { undercurl = true, sp = hl.get("DiagnosticWarn").fg })
      hl.set("DiagnosticUnderlineHint",  { undercurl = true, sp = hl.get("DiagnosticHint").fg })
      hl.set("DiagnosticUnderlineInfo",  { undercurl = true, sp = hl.get("DiagnosticInfo").fg })
      hl.set("DiagnosticOk", { fg = colors.ui_green })
      hl.set("DiagnosticUnderlineOk",  { undercurl = true, sp = hl.get("DiagnosticOk").fg })
      hl.set("DiagnosticUnnecessary", { fg = hl.get("Ignore").fg })
    end
  }
})
EOF

colorscheme mellifluous
