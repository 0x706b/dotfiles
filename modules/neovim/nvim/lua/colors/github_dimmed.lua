local palette = require'github-theme.palette.dimmed'

local c = palette()

return {
  bg = c.bg,
  bg0 = c.bg2,
  bg1 = c.bg_highlight,
  bg2 = c.bg_search,
  fg = c.fg_light,
  fg0 = c.fg_gutter,
  fg1 = c.fg_dark,
  fg2 = c.border,
  b = {
    red = c.error,
    yellow = c.warning,
    blue = c.blue
  },
  n = {
    red = c.red,
    yellow = c.yellow,
    blue = c.blue,
    green = c.green,
    magenta = c.magenta
  },
  git = {
    add = c.git.add,
    change = c.git.change,
    delete = c.git.delete
  }
}
