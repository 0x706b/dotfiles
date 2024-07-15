local is_visible = function(bufnr)
  for _, tabid in ipairs(vim.api.nvim_list_tabpages()) do
    for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(tabid)) do
      local winbufnr = vim.api.nvim_win_get_buf(winid)
      local winvalid = vim.api.nvim_win_is_valid(winid)

      if winvalid and winbufnr == bufnr then
        return true
      end
    end
  end

  return false
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  additional_vim_regex_highlighting = false,
  highlight = {
    enable = true,
    disable = function (_, bufnr)
      if is_visible(bufnr) then
        return false
      else
        return true
      end
    end
    -- disable = { 'typescript', 'typescriptreact', 'tsx' }
  },
  indent = {
    enable = true,
    -- disable = { 'typescript', 'typescriptreact', 'tsx' }
  }
}

vim.api.nvim_set_keymap(
  'n',
  '<leader>sp',
  ":lua require'nvim-treesitter-playground.hl-info'.show_hl_captures()<CR>",
  { noremap = true, silent = true }
)

