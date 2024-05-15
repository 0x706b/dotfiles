local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

local prettier_eslint = formatters.shell({ cmd = { "prettier-eslint", "--stdin", "--stdin-filepath", "%" } })

format_on_save.setup({
  formatter_by_ft = {
    typescript = prettier_eslint,
    typescriptreact = prettier_eslint
  }
})

