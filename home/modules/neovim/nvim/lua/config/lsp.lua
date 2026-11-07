local border = require("util.border")
local api, lsp, diagnostic, map = vim.api, vim.lsp, vim.diagnostic, vim.keymap

diagnostic.config({
  virtual_text = false,
  float = {
    border = "rounded",
    scope = "cursor",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = ""
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticLineError",
      [vim.diagnostic.severity.WARN] = "DiagnosticLineWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticLineInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticLineHint",
    },
  },
})

vim.diagnostic.config({
  -- Other diagnostic options can be configured here, e.g., virtual_text, float, etc.
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

api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Check if the server supports inlay hints (Neovim 0.10+)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- Resolve TypeScript from each buffer, walking up through workspace packages so
-- monorepos can use their own installed versions. Missing installations use
-- the classic server rather than assuming that the native LSP is available.
local function typescript_package(dir)
  while dir and dir ~= "" do
    local package_dir = vim.fs.joinpath(dir, "node_modules", "@typescript/native")
    local package_file = vim.fs.joinpath(package_dir, "package.json")
    local ok, lines = pcall(vim.fn.readfile, package_file)
    if ok then
      local decoded, package = pcall(vim.json.decode, table.concat(lines, "\n"))
      if decoded and type(package) == "table" then
        return package_dir, tonumber(tostring(package.version):match("^(%d+)"))
      end
      return nil, nil
    end
    local parent = vim.fs.dirname(dir)
    if parent == dir then break end
    dir = parent
  end
end

local function typescript_root(bufnr, on_dir, native)
  local package_dir, major = typescript_package(vim.fs.dirname(api.nvim_buf_get_name(bufnr)))
  if (major ~= nil and major >= 7) ~= native then return end
  local root = vim.fs.root(bufnr, { "tsconfig.json", "jsconfig.json", "package.json", ".git" })
  if root and native then
    local package_root = vim.fs.dirname(vim.fs.dirname(package_dir))
    if vim.startswith(package_root, root .. "/") then root = package_root end
  end
  if root then on_dir(root) end
end

local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config("tsc", {
  cmd = function(dispatchers, config)
    local package_dir = typescript_package(config.root_dir)
    return vim.lsp.rpc.start({ vim.fs.joinpath(package_dir, "bin", "tsc"), "--lsp", "--stdio" }, dispatchers)
  end,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = function(bufnr, on_dir) typescript_root(bufnr, on_dir, true) end,
  capabilities = capabilities,
})
vim.lsp.config("ts_ls", {
  root_dir = function(bufnr, on_dir) typescript_root(bufnr, on_dir, false) end,
  capabilities = capabilities,
})
vim.lsp.enable({ "tsc", "ts_ls" })

-- map.set("n", "K", lsp.buf.hover, { buffer = true })

vim.lsp.config("eslint", {
  useESLintClass = true,
  workingDirectory = {
    mode = "auto"
  }
})
vim.lsp.enable("eslint")

vim.lsp.config("jsonls", {})
vim.lsp.enable("jsonls")

vim.lsp.config("luals", {
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
vim.lsp.enable("luals")

vim.lsp.config("nil_ls", {})
vim.lsp.enable("nil_ls")

vim.lsp.enable("clangd")

local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
