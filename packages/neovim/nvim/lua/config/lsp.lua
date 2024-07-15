local lspconfig = require("lspconfig")
local border = require("util.border")
local api, lsp, diagnostic, map = vim.api, vim.lsp, vim.diagnostic, vim.keymap

diagnostic.config({
  virtual_text = false,
  float = {
    border = "rounded",
    scope = "cursor"
  }
})

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
  border = "rounded"
})

api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function(ev)
    local hasDocumentHighlight = false
    local clients = vim.lsp.get_clients({ bufnr = ev.buf })
    for _, client in pairs(clients) do
      if client.server_capabilities.documentHighlightProvider ~= nil then
        hasDocumentHighlight = true
        break
      end
    end

    if hasDocumentHighlight == true then
      vim.lsp.buf.document_highlight()
    end
  end
})

api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  callback = function()
    vim.lsp.buf.clear_references()
  end
})

api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    vim.diagnostic.reset()
  end
})

-- map.set("n", "K", lsp.buf.hover, { buffer = true })

lspconfig.eslint.setup({
  useESLintClass = true,
  workingDirectory = {
    mode = "auto"
  }
})

lspconfig.jsonls.setup({})

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
