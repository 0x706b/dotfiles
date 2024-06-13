local colors = require("mellifluous").load()


require('mellifluous.config').prepare()

local colors = require('mellifluous.colors').get_colors()
local highlighter = require('mellifluous.utils.highlighter')

require('mellifluous.highlights').set(highlighter, colors)
require('mellifluous.config').set_highlight_overrides(highlighter, colors)

return {
  bg = colors.bg.hex,
  bg0 = colors.bg:lightened(5).hex,
  bg1 = colors.bg:lightened(10).hex,
  fg = colors.fg.hex,
  fg0 = colors.fg.hex,
  fg1 = colors.fg.hex,
  fg2 = colors.fg.hex,
  b = {
    red = colors.red.hex,
    yellow = colors.yellow.hex,
    blue = colors.blue.hex
  },
  n = {
    red = colors.red.hex,
    yellow = colors.yellow.hex,
    blue = colors.blue.hex,
    green = colors.green.hex,
    magenta = colors.purple.hex,
  },
  git = {
    add = colors.green.hex,
    change = colors.orange.hex,
    delete = colors.red.hex
  }
}
