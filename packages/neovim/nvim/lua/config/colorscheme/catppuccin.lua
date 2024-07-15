local M = {}
local catppuccin = require("catppuccin")

M.initialized = false

M.init = function()
  catppuccin.setup({
    flavour = "mocha",
    color_overrides = {
      mocha = {
        base = "#181825",
      }
    },
    integrations = {
      barbar = true,
      noice = true,
      native_lsp = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
          ok = { "undercurl" },
        }
      }
    }
  })

  local mocha = require("catppuccin.palettes").get_palette("mocha")

  M.galaxyline_colors = {
    bg = mocha.crust,
    bg0 = mocha.mantle,
    bg1 = mocha.mantle,
    fg = mocha.text,
    fg0 = mocha.subtext1,
    fg1 = mocha.subtext0,
    fg2 = mocha.overlay2,
    b = {
      red = mocha.red,
      yellow = mocha.peach,
      blue = mocha.teal
    },
    n = {
      red = mocha.red,
      yellow = mocha.yellow,
      blue = mocha.blue,
      green = mocha.green,
      magenta = mocha.lavender,
    },
    git = {
      add = mocha.green,
      change = mocha.yellow,
      delete = mocha.red
    }
  }

  vim.cmd.colorscheme("catppuccin")

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M
