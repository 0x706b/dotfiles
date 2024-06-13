
local c = require('nordic.colors')

return {
  bg = c.gray0,
  bg0 = c.gray1,
  bg1 = c.black1,
  fg = c.white0_normal,
  fg0 = c.white1,
  fg1 = c.white2,
  fg2 = c.white3,
  b = {
    red = c.red.bright,
    yellow = c.yellow.bright,
    blue = c.blue1
  },
  n = {
    red = c.red.base,
    yellow = c.yellow.base,
    blue = c.magenta.base,
    green = c.green.base,
    magenta = c.magenta.bright,
  },
  git = {
    add = c.green.base,
    change = c.orange.base,
    delete = c.red.base
  }
}
