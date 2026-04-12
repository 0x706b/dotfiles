local M = {}
local vague = require("vague")

M.initialized = false

M.init = function()
  vague.setup({
    italic = false,
    on_highlights = function(highlights, colors)
      highlights.StatusLine.bg = colors.bg
      highlights.TabLineSel = {}
      highlights.TabLineSel.fg = colors.fg
      highlights.TabLineSel.bg = "#4c4c65"
    end
  })

  local colors = vague.get_palette()

  M.galaxyline_colors = {
    bg = colors.bg,
    bg0 = colors.bg,
    bg1 = colors.bg,
    fg = colors.fg,
    fg0 = colors.fg,
    fg1 = colors.fg,
    fg2 = colors.fg,
    b = {
      red = colors.error,
      yellow = colors.delta,
      blue = colors.hint
    },
    n = {
      red = colors.error,
      yellow = colors.string,
      blue = colors.builtin,
      green = colors.plus,
      magenta = colors.parameter,
    },
    git = {
      add = colors.plus,
      change = colors.delta,
      delete = colors.error
    }
  }

  vim.cmd.colorscheme("vague")

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M

