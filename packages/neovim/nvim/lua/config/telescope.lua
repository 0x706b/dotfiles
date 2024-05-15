require("telescope").setup({})

local map = vim.api.nvim_set_keymap

map('n', 'gd', ':lua require("telescope.builtin").lsp_definitions{}<CR>', { noremap = true, silent = true })
map('n', 'gr', ':lua require("telescope.builtin").lsp_references{}<CR>', { noremap = true, silent = true })
