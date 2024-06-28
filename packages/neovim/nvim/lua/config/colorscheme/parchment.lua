local M = {}

M.initialized = false

M.init = function()
  local colorscheme = require("parchment")
  local lushUtils = require("util.lush")

  M.galaxyline_colors = lushUtils.lushToHex(colorscheme.Parchment.lush)

  vim.cmd.colorscheme("parchment")

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M
