local M = {}

M.galaxyline_colors = nil
M.colorscheme = nil

M.set_colorscheme = function(name)
  if M.colorscheme == name then
    return
  end

  local colorscheme_module = require("config.colorscheme." .. name)

  colorscheme_module.init()

  M.galaxyline_colors = colorscheme_module.galaxyline_colors
  M.colorscheme = name
end

return M
