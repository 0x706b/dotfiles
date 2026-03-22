local M = {}

M.initialized = false

M.init = function()
  vim.opt.background = "dark"

  local palette = require("nordic.colors")

  require("nordic").load()

  local c = require('nordic.colors')

  M.galaxyline_colors = {
    bg = c.gray0,
    bg0 = c.gray1,
    bg1 = c.black1,
    fg = c.white0_normal,
    fg0 = c.white1,
    fg1 = c.white2,
    fg2 = c.white3,
    b = {
      red = c.red.bright,
      yellow = c.yellow.bright,
      blue = c.blue1
    },
    n = {
      red = c.red.base,
      yellow = c.yellow.base,
      blue = c.magenta.base,
      green = c.green.base,
      magenta = c.magenta.bright,
    },
    git = {
      add = c.green.base,
      change = c.orange.base,
      delete = c.red.base
    }
  }

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M
