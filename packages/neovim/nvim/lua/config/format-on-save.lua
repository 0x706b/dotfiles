local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

local prettier_eslint = formatters.shell({ cmd = { "prettier", "--stdin-filepath", "%", "|", "eslint-fix-stdout", "-f", "%" } })

format_on_save.setup({
  formatter_by_ft = {
    typescript = prettier_eslint,
    typescriptreact = prettier_eslint,
    javascript = prettier_eslint,
  }
})

