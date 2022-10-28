lua << EOF
require'github-theme'.setup({
  theme_style = "dimmed",
  overrides = function(c)
    return {
      StatusLine = {bg = c.bg_highlight},
      TabLineSel = {bg = c.bg_visual_selection}
    }
  end,
  transparent = true
})
EOF
