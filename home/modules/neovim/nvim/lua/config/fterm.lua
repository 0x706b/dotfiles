require'FTerm'.setup({
    border = 'rounded',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
