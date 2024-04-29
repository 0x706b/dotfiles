lua << EOF
require'github-theme'.setup({
  groups = {
    all = {
      StatusLine = { bg = '#222020' },
      TabLineSel = { bg = 'sel0' },
      CursorLine = { bg = 'bg2' }
    }
  },
  options = {
    transparent = true
  }
})

vim.cmd('colorscheme github_dark_default')
EOF
