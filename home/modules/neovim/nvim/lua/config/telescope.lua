local themes = require("telescope.themes")

local dropdown_theme = themes.get_dropdown({
  winblend = 20,
})

require("telescope").setup({})

local builtin = require("telescope.builtin")

local map = vim.keymap.set

map(
  'n', 'gd',
  function()
    builtin.lsp_definitions()
  end,
  { noremap = true, silent = true }
)

map(
  'n', 'gr',
  function()
    builtin.lsp_references()
  end,
  { noremap = true, silent = true }
)

map(
  "n", "<leader>x",
  function()
    builtin.diagnostics()
  end,
  { noremap = true, silent = true }
)

map(
  "n", "<leader>g",
  function()
    builtin.live_grep()
  end,
  { noremap = true, silent = true }
)

map(
  "n", "<leader>f",
  function()
    builtin.git_files(dropdown_theme)
  end,
  { noremap = true, silent = true }
)

