require("typescript-tools").setup({
  single_file_support = false,
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
  tsserver_file_preferences = {
    includeInlayParameterNameHints = "all",
    includeInlayEnumMemberValueHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayVariableTypeHints = true
  },
})

