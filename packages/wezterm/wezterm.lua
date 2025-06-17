local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- vague
config.colors = {
  foreground = "#cdcdcd",
  background = "#141415",
  cursor_bg = "#CBAA88",
  selection_fg = "#cdcdcd",
  selection_bg = "#252530",
  ansi = {
    "#252530",
    "#d8647e",
    "#7fa563",
    "#f3be8c",
    "#6e94b2",
    "#bb9dbd",
    "#aeaed1",
    "#cdcdcd",
  },
  brights = {
    "#606079",
    "#e08398",
    "#99b782",
    "#f5cb96",
    "#8ba9c1",
    "#c9b1ca",
    "#bebeda",
    "#606079",
  }
}

-- mellifluous dark
-- config.colors = {
--   foreground = "#C8C8C8",
--   background = "#1D1D1D",
--   cursor_bg = "#CBAA88",
--   selection_fg = "#C8C8C8",
--   selection_bg = "#323232",
--   ansi = {
--     "#1D1D1D",
--     "#D59192",
--     "#B3B393",
--     "#BFAF8E",
--     "#A8A1BE",
--     "#B99BB5",
--     "#A8A1BE",
--     "#5B5B5B",
--   },
--   brights = {
--     "#5B5B5B",
--     "#FFBCBD",
--     "#DFDFBE",
--     "#ECDBB9",
--     "#D4CDEB",
--     "#E6C6E1",
--     "#D4CDEB",
--     "#5B5B5B",
--   }
-- }

-- mellifluous light
-- config.colors = {
--   foreground = "#111111",
--   background = "#e1e1e1",
--   cursor_bg = "#a16927",
--   selection_fg = "#111111",
--   selection_bg = "#cbcbcb",
--   brights = {
--     "#919191",
--     "#b73242",
--     "#63611e",
--     "#9c7a2a",
--     "#5a418a",
--     "#863e7f",
--     "#5a418a",
--     "#919191",
--   },
--   ansi = {
--     "#919191",
--     "#e86069",
--     "#8b8a49",
--     "#c8a257",
--     "#826ab6",
--     "#b267aa",
--     "#826ab6",
--     "#414141",
--   }
-- }

config.inactive_pane_hsb = {
  saturation = 0.75
}

config.font = wezterm.font 'PragmataPro Mono Liga'

config.freetype_load_flags = 'NO_HINTING'
config.freetype_load_target = 'Light'
config.dpi = 144
config.line_height = 1.1

config.enable_tab_bar = false

return config
