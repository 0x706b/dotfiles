local config = vim.fn['sonokai#get_configuration']()
local palette = vim.fn['sonokai#get_palette'](config.style)

return {
  bg = palette.bg1[1],
  bg0 = palette.bg2[1],
  bg1 = palette.bg3[1],
  bg2 = palette.bg4[1],
  fg = palette.fg[1],
  fg0 = palette.bg4[1],
  fg1 = palette.grey_dim[1],
  fg2 = palette.grey[1],
  b = {
    red = palette.red[1],
    yellow = palette.yellow[1],
    blue = palette.blue[1],
  },
  n = {
    yellow = palette.yellow[1],
    red = palette.red[1],
    blue = palette.blue[1],
    green = palette.green[1],
    magenta = palette.purple[1],
  },
  git = {
    add = palette.green[1],
    change = palette.blue[1],
    delete = palette.red[1]
  }
}
