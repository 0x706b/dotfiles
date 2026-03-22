local M = {}

M.initialized = false

M.init = function()
  vim.g.rose_pine_variant = "moon"

  vim.cmd.colorscheme("rose-pine")

  local c = require("rose-pine.palette")

  M.galaxyline_colors = {
    bg = c.base,
    bg0 = c.surface,
    bg1 = c.surface,
    bg2 = c.highlight,
    fg = c.text,
    fg0 = c.highlight_overlay,
    fg1 = c.inactive,
    fg2 = c.subtle,
    b = {
      red = c.love,
      yellow = c.gold,
      blue = c.pine,
    },
    n = {
      red = c.love,
      yellow = c.rose,
      blue = c.pine,
      green = c.foam,
      magenta = c.iris
    },
    git = {
      add = c.foam,
      change = c.pine,
      delete = c.love
    }
  }

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M
