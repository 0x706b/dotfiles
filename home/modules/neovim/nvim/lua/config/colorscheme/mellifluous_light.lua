local M = {}
local mellifluous = require("mellifluous")

M.initialized = false

M.init = function()
  vim.opt.background = "light"

  mellifluous.setup({
    color_set = 'mellifluous',
    mellifluous = {
      bg_contrast = "soft",
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
      light = function(hl, colors)
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

        hl.set("Color0", { bg = colors.bg.hex })
        hl.set("Color1", { bg = colors.red.hex })
        hl.set("Color2", { bg = colors.green.hex })
        hl.set("Color3", { bg = (colors.yellow and colors.yellow.hex) or colors.strings.hex })
        hl.set("Color4", { bg = colors.blue.hex })
        hl.set("Color5", { bg = colors.purple.hex })
        hl.set("Color6", { bg = (colors.cyan and colors.cyan.hex) or colors.blue.hex })
        hl.set("Color7", { bg = colors.fg4.hex })

        local li_value = 16
        hl.set("Color8", { bg = colors.bg2.hex })
        hl.set("Color9", { bg = colors.red:lightened(li_value).hex })
        hl.set("Color10", { bg = colors.green:lightened(li_value).hex })
        hl.set("Color11", { bg = (colors.yellow and colors.yellow:lightened(li_value).hex)
          or colors.strings:lightened(li_value).hex })
        hl.set("Color12", { bg = colors.blue:lightened(li_value).hex })
        hl.set("Color13", { bg = colors.purple:lightened(li_value).hex })
        hl.set("Color14", { bg = (colors.cyan and colors.cyan:lightened(li_value).hex)
          or colors.blue:lightened(li_value).hex })
        hl.set("Color15", { bg = colors.fg2.hex })
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
