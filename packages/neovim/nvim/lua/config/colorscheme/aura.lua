local M = {}
local aura = require("aura-theme.common.core")
local color = require("aura-theme.common.color")

M.initialized = false

M.init = function()
  local palette = aura.createPaletteByPattern("aura-soft-dark")

  M.galaxyline_colors = {
    bg = palette.black,
    bg0 = color.lighten(palette.black, 4, palette.white),
    bg1 = color.lighten(palette.black, 8, palette.white),
    fg = palette.white,
    fg0 = color.darken(palette.white, 4, palette.black),
    fg1 = color.darken(palette.white, 8, palette.black),
    fg2 = color.darken(palette.white, 16, palette.black),
    b = {
      red = palette.red,
      yellow = palette.orange,
      blue = palette.blue
    },
    n = {
      red = palette.red,
      yellow = palette.orange,
      blue = palette.blue,
      green = palette.green,
      magenta = palette.purple,
    },
    git = {
      add = palette.green,
      change = palette.orange,
      delete = palette.red
    }
  }

  vim.cmd.colorscheme("aura-soft-dark")

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M
