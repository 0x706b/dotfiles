local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")
local vim_notify = require("format-on-save.error-notifiers.vim-notify")

local prettier_eslint = formatters.if_file_exists({
  pattern = { "prettier.config.js", "eslint.config.js" },
  formatter = formatters.shell({
    cmd = function ()
      local dirname = vim.fn.expand("%:p:h")
      local handle = io.popen("cd " .. dirname .. " && upfind eslint.config.*")

      if handle == nil then
        return
      end

      local output = handle:read("*a")
      handle:close()

      output = string.gsub(
        string.gsub(
          string.gsub(output, '^%s+', ''),
          '%s+$',
          ''
        ),
        '[\n\r]+',
        ' '
      )

      return {
        "prettier", "--stdin-filepath", "%", "|",
        "eslint_d", "--fix-to-stdout", "--stdin", "--stdin-filename", "%", "--config", output
      }
    end
  })
})

format_on_save.setup({
  error_notifier = vim_notify,
  formatter_by_ft = {
    typescript = prettier_eslint,
    typescriptreact = prettier_eslint,
    javascript = prettier_eslint
  }
})

