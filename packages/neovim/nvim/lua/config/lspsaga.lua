local map = vim.keymap.set

require('lspsaga').setup {
  ui = {
    code_action = ""
  },
  rename = {
    keys = {
      quit = "<esc>"
    }
  },
  code_action = {
    keys = {
      quit = "<esc>"
    }
  }
}

map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true, noremap = true })

map("n", "<leader>r", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
map("n", "<leader>p", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
