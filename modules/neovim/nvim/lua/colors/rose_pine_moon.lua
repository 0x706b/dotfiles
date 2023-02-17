local c = require'rose-pine.palette'

return {
  bg = c.base,
  bg0 = c.surface,
  bg1 = c.surface,
  bg2 = c.highlight,
  fg = c.text,
  fg0 = c.highlight_overlay,
  fg1 = c.inactive,
  fg2 = c.subtle,
  b = {
    red = c.love,
    yellow = c.gold,
    blue = c.pine,
  },
  n = {
    red = c.love,
    yellow = c.rose,
    blue = c.pine,
    green = c.foam,
    magenta = c.iris
  },
  git = {
    add = c.foam,
    change = c.pine,
    delete = c.love
  }
}

