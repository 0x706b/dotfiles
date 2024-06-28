local M = {}

M.initialized = false

M.init = function()
  local colorscheme = require("monotone")
  local lushUtils = require("util.lush")

  M.galaxyline_colors = lushUtils.lushToHex(colorscheme.Monotone.lush)

  vim.cmd.colorscheme("monotone")

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M
