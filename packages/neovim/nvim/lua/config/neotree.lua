require("neo-tree").setup({
  window = {
    mappings = {
      ["l"] = "open",
      ["h"] = "close_node"
    }
  }
})

local map = vim.api.nvim_set_keymap

map("n", "<leader>er", ":Neotree reveal position=right<CR>", { noremap = true, silent = true })
map("n", "<leader>el", ":Neotree reveal position=left<CR>", { noremap = true, silent = true })
map("n", "<leader>ee", ":Neotree reveal position=float<CR>", { noremap = true, silent = true })

