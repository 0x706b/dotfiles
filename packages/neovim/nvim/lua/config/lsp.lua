local lspconfig = require("lspconfig")

vim.diagnostic.config({
  virtual_text = false,
  float = {
    border = "rounded",
    scope = "cursor"
  }
})

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })]]

vim.cmd [[autocmd CursorHold * silent lua vim.lsp.buf.document_highlight()]]
vim.cmd [[autocmd CursorMoved  * lua vim.lsp.buf.clear_references()]]
vim.cmd [[autocmd CursorMovedI * lua vim.lsp.buf.clear_references()]]

vim.cmd [[autocmd InsertEnter * silent lua vim.diagnostic.reset()]]

lspconfig.eslint.setup({
  useESLintClass = true,
  workingDirectory = {
    mode = "auto"
  }
})

lspconfig.lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

lspconfig.nil_ls.setup({})

local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
