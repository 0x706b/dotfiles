local M = {}

M.initialized = false

M.init = function()
  local colorscheme = require("crumbling")
  local lushUtils = require("util.lush")

  M.galaxyline_colors = lushUtils.lushToHex(colorscheme.Crumbling.lush)

  vim.cmd.colorscheme("crumbling")

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M
