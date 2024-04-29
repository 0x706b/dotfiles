local palette = require'gruvbox.palette'.get_base_colors()

return {
  bg = palette.bg0,
  bg0 = palette.bg1,
  bg1 = palette.bg2,
  bg2 = palette.bg3,
  fg = palette.fg0,
  fg0 = palette.fg1,
  fg1 = palette.fg2,
  fg2 = palette.fg3,
  b = {
    red = palette.red,
    yellow = palette.yellow,
    blue = palette.blue
  },
  n = {
    yellow = palette.neutral_yellow,
    red = palette.neutral_red,
    blue = palette.neutral_blue,
    green = palette.neutral_green,
    magenta = palette.neutral_purple
  },
  git = {
    add = palette.green,
    change = palette.blue,
    delete = palette.red
  }
}
