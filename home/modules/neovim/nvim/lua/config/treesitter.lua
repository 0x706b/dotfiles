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
  -- ensure_installed = 'all',
  additional_vim_regex_highlighting = true,
  highlight = {
    enable = true,
    disable = function (lang, bufnr)
      if is_visible(bufnr) then
        return false
      end

      return true
    end
  },
  indent = {
    enable = true,
    disable = function (lang, bufnr)
      if is_visible(bufnr) then
        return false
      end

      return true
    end
  }
}

-- local ts = require('nvim-treesitter')
--
-- -- State tracking for async parser loading
-- local parsers_loaded = {}
-- local parsers_pending = {}
-- local parsers_failed = {}
--
-- local ns = vim.api.nvim_create_namespace('treesitter.async')
--
-- -- Helper to start highlighting and indentation
-- local function start(buf, lang)
--   local ok = pcall(vim.treesitter.start, buf, lang)
--   if ok then
--     vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--   end
--   return ok
-- end
--
-- -- Install core parsers after lazy.nvim finishes loading all plugins
-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'LazyDone',
--   once = true,
--   callback = function()
--     ts.install({
--       'bash',
--       'comment',
--       'css',
--       'diff',
--       'fish',
--       'git_config',
--       'git_rebase',
--       'gitcommit',
--       'gitignore',
--       'html',
--       'javascript',
--       'json',
--       'latex',
--       'lua',
--       'luadoc',
--       'make',
--       'markdown',
--       'markdown_inline',
--       'norg',
--       'python',
--       'query',
--       'regex',
--       'scss',
--       'svelte',
--       'toml',
--       'tsx',
--       'typescript',
--       'typst',
--       'vim',
--       'vimdoc',
--       'vue',
--       'xml',
--     }, {
--       max_jobs = 8,
--     })
--   end,
-- })
--
-- -- Decoration provider for async parser loading
-- vim.api.nvim_set_decoration_provider(ns, {
--   on_start = vim.schedule_wrap(function()
--     if #parsers_pending == 0 then
--       return false
--     end
--     for _, data in ipairs(parsers_pending) do
--       if vim.api.nvim_buf_is_valid(data.buf) then
--         if start(data.buf, data.lang) then
--           parsers_loaded[data.lang] = true
--         else
--           parsers_failed[data.lang] = true
--         end
--       end
--     end
--     parsers_pending = {}
--   end),
-- })
--
-- local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })
--
-- local ignore_filetypes = {
--   'checkhealth',
--   'lazy',
--   'mason',
--   'snacks_dashboard',
--   'snacks_notif',
--   'snacks_win'
-- }
--
-- vim.api.nvim_create_autocmd('FileType', {
--   group = group,
--   pattern = { '<filetype>' },
--   callback = function(event)
--     if vim.tbl_contains(ignore_filetypes, event.match) then
--       return
--     end
--
--     local lang = vim.treesitter.language.get_lang(event.match) or event.match
--     local buf = event.buf
--
--     if parsers_failed[lang] then
--       return
--     end
--
--     if parsers_loaded[lang] then
--       -- Parser already loaded, start immediately (fast path)
--       start(buf, lang)
--     else
--       -- Queue for async loading
--       table.insert(parsers_pending, { buf = buf, lang = lang })
--     end
--
--     -- Auto-install missing parsers (async, no-op if already installed)
--     ts.install({ lang })
--   end
-- })

-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = 'all',
--   additional_vim_regex_highlighting = false,
--   highlight = {
--     enable = true,
--     disable = function (_, bufnr)
--       if is_visible(bufnr) then
--         return false
--       else
--         return true
--       end
--     end
--     -- disable = { 'typescript', 'typescriptreact', 'tsx' }
--   },
--   indent = {
--     enable = true,
--     -- disable = { 'typescript', 'typescriptreact', 'tsx' }
--   }
-- }

vim.api.nvim_set_keymap(
  'n',
  '<leader>sp',
  ":lua require'nvim-treesitter-playground.hl-info'.show_hl_captures()<CR>",
  { noremap = true, silent = true }
)

