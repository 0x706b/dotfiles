local z = require 'zenbones.palette'.dark
local lushUtils = require 'util.lush'

local colors = {
  fg = z.fg,
  bg = z.bg,
  bg0 = z.bg.da(4),
  bg1 = z.bg.li(12),
  bg2 = z.bg.da(20),
  fg0 = z.fg.li(4),
  fg1 = z.fg.li(8),
  fg2 = z.fg.li(12),
  b = {
    red = z.rose,
    yellow = z.wood,
    blue = z.water
  },
  n = {
    yellow = z.wood,
    green = z.leaf,
    red = z.rose,
    blue = z.sky,
    magenta = z.blossom
  },
  git = {
    add = z.leaf,
    change = z.wood,
    delete = z.rose
  }
}

return lushUtils.lushToHex(colors)
