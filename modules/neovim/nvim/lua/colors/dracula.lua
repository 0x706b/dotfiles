local c = require('dracula').colors()

return {
  bg = c.bg,
  bg0 = c.comment,
  bg1 = c.black,
  fg = c.fg,
  fg0 = c.selection,
  fg1 = c.comment,
  fg2 = c.white,
  b = {
    red = c.bright_red,
    yellow = c.bright_yellow,
    blue = c.bright_blue
  },
  n = {
    red = c.red,
    yellow = c.yellow,
    blue = c.purple,
    green = c.green,
    magenta = c.pink,
  },
  git = {
    add = c.green,
    change = c.orange,
    delete = c.red
  }
}
