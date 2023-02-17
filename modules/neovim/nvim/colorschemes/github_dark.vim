lua << EOF
require'github-theme'.setup({
  theme_style = "dark",
  overrides = function(c)
    return {
      StatusLine = {bg = c.bg_highlight},
      TabLineSel = {bg = c.bg_visual_selection}
    }
  end
})
EOF
