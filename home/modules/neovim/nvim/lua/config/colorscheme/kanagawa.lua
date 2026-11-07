local M = {}
local kanagawa = require("kanagawa")

M.initialized = false

M.init = function()
  local options = {
    theme = "wave",
    overrides = function(colors)
      local theme = colors.theme

      return {
        StatusLine = { bg = theme.ui.bg_p2 }
      }
    end
  }
  kanagawa.setup(options)

  local colors = require("kanagawa.colors").setup(options)

  local palette = colors.palette
  local ui = colors.theme.ui
  local vcs = colors.theme.vcs

  M.galaxyline_colors = {
    bg = ui.bg,
    bg0 = ui.bg_p1,
    bg1 = ui.bg_p2,
    fg = ui.fg,
    fg0 = ui.fg_dim,
    fg1 = ui.fg_dim,
    fg2 = ui.fg_dim,
    b = {
      red = palette.waveRed,
      yellow = palette.carpYellow,
      blue = palette.springBlue
    },
    n = {
      red = palette.dragonRed,
      yellow = palette.dragonYellow,
      blue = palette.dragonBlue2,
      green = palette.dragonGreen2,
      magenta = palette.dragonPink,
    },
    git = {
      add = vcs.add,
      change = vcs.change,
      delete = vcs.delete
    }
  }

  vim.cmd.colorscheme("kanagawa-wave")

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M
