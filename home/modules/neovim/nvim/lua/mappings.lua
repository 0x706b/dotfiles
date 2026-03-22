local map = vim.keymap.set

map("n", "=", ":", { noremap = true })
map("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<TAB>", ":bprevious<CR>", { noremap = true, silent = true })
map("n", "<leader>'", ":vs<CR>", { noremap = true, silent = true })
map("n", "<C-c>", ":bp|db #<CR>", { noremap = true, silent = true })

map("n", "<leader>h", ":wincmd h<CR>", { noremap = true, silent = true })
map("n", "<leader>j", ":wincmd j<CR>", { noremap = true, silent = true })
map("n", "<leader>k", ":wincmd k<CR>", { noremap = true, silent = true })
map("n", "<leader>l", ":wincmd l<CR>", { noremap = true, silent = true })

