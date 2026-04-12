local opt, opt_local, api, map = vim.opt, vim.opt_local, vim.api, vim.keymap.set

-- makes <leader> == <space>
vim.g.mapleader = " "

-- enable buffer update on file change
opt.autoread = true

opt.termguicolors = true
opt.showmode = false
opt.wildmenu = true
opt.list = true
opt.listchars = { tab = "» ", extends = "›", precedes = "‹", nbsp = "·", trail = "·" }
opt.hlsearch = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.mouse = { a = true }
opt.cmdheight = 2
opt.updatetime = 150
opt.shortmess:append({ c = true })
opt.signcolumn = "yes"
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.cursorline = true
opt.colorcolumn = "120"
opt.laststatus = 3

-- vim.g.node_host_prog = string.gsub(vim.fn.system("npm prefix --location=global"), "%s+", "") .. "/lib/node_modules/neovim/bin/cli.js"

api.nvim_create_autocmd("WinEnter", {
  callback = function()
    vim.cmd("syntax on")
    opt_local.cursorline = true
  end
})

api.nvim_create_autocmd("WinLeave", {
  callback = function()
    vim.cmd("syntax off")
    opt_local.cursorline = false
  end
})


api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
  end
})

-- Trigger checktime when certain events happen to refresh the buffer
api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
