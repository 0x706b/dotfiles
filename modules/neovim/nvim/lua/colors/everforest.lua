local config = vim.fn['everforest#get_configuration']()
local palette = vim.fn['everforest#get_palette'](config.background)

return {
  bg = palette.bg0[1],
  bg0 = palette.bg1[1],
  bg1 = palette.bg1[1],
  bg2 = palette.bg3[1],
  fg = palette.fg[1],
  fg0 = palette.grey2[1],
  fg1 = palette.grey1[1],
  fg2 = palette.grey0[1],
  b = {
    red = palette.red[1],
    yellow = palette.yellow[1],
    blue = palette.blue[1]
  },
  n = {
    yellow = palette.yellow[1],
    red = palette.red[1],
    blue = palette.blue[1],
    green = palette.green[1],
    magenta = palette.purple[1]
  },
  git = {
    add = palette.green[1],
    change = palette.blue[1],
    delete = palette.red[1]
  }
}
