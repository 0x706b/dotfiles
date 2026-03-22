local M = {}

M.initialized = false

M.init = function()
  vim.opt.background = "dark"
  vim.g.colors_name = "zenburn"

  package.loaded["zenburn"] = nil

  local lush = require('lush')

  local zenburn = require('zenburn')

  local spec = lush.extends({ zenburn }).with(function ()
    return {
      LspCodeLens { zenburn.DiagnosticInfo }
    }
  end)

  lush(spec)

  N.galaxyline_colors = zenburn.Zenburn.lush

  M.initialized = true
end

if not M.initialized then
  M.init()
end

return M
