local M = {}
local mellifluous = require("mellifluous")

M.initialized = false

M.init = function()
  mellifluous.setup({
    color_set = 'mellifluous',
    mellifluous = {
      color_overrides = {
        dark = {
          bg = function (bg)
            return bg:lightened(2)
          end
        }
      }
    },
    color_overrides = {
      dark = {
        -- bg = function(bg)
        --   return bg:darkened(2)
        -- end
      }
    },
    plugins = {
      treesitter = true
    },
    transparent_background = {
      floating_windows = false
    },
    flat_background = {
      floating_windows = true
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
        hl.set("NeoTreeNormal", hl.get("Normal"))
        hl.set("NeoTreeNormalNC", hl.get("Normal"))
        hl.set("NeoTreePopup", hl.get("Normal"))
        hl.set("NeoTreeEndOfBuffer", hl.get("EndOfBuffer"))
        hl.set("NeoTreeSeparator", hl.get("VertSplit"))
        hl.set("NeoTreeWinSeparator", hl.get("VertSplit"))
      end
    }
  })

  local hl, colors = mellifluous.load()

  M.galaxyline_colors = {
    bg = colors.bg.hex,
    bg0 = colors.bg:lightened(4).hex,
    bg1 = colors.bg:lightened(8).hex,
    fg = colors.fg.hex,
    fg0 = colors.fg:darkened(4).hex,
    fg1 = colors.fg:darkened(8).hex,
    fg2 = colors.fg:darkened(16).hex,
    b = {
      red = colors.red.hex,
      yellow = colors.yellow.hex,
      blue = colors.blue.hex
    },
    n = {
      red = colors.red.hex,
      yellow = colors.yellow.hex,
      blue = colors.blue.hex,
      green = colors.green.hex,
      magenta = colors.purple.hex,
    },
    git = {
      add = colors.green.hex,
      change = colors.orange.hex,
      delete = colors.red.hex
    }
  }

  vim.cmd.colorscheme("mellifluous")

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M
