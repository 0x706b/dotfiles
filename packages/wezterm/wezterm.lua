local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- vague
-- config.colors = {
--   foreground = "#cdcdcd",
--   background = "#141415",
--   cursor_bg = "#CBAA88",
--   selection_fg = "#cdcdcd",
--   selection_bg = "#252530",
--   ansi = {
--     "#252530",
--     "#d8647e",
--     "#7fa563",
--     "#f3be8c",
--     "#6e94b2",
--     "#bb9dbd",
--     "#aeaed1",
--     "#cdcdcd",
--   },
--   brights = {
--     "#606079",
--     "#e08398",
--     "#99b782",
--     "#f5cb96",
--     "#8ba9c1",
--     "#c9b1ca",
--     "#bebeda",
--     "#606079",
--   }
-- }

-- kanagawa wave
config.colors = {
  foreground = "#dcd7ba",
  background = "#1f1f28",

  cursor_bg = "#c8c093",
  cursor_fg = "#c8c093",
  cursor_border = "#c8c093",

  selection_fg = "#c8c093",
  selection_bg = "#2d4f67",

  scrollbar_thumb = "#16161d",
  split = "#16161d",

  ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
  brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
  indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}

-- kanagawa dragon
-- config.force_reverse_video_cursor = true
--
-- config.colors = {
--   foreground = "#c5c9c5",
--   background = "#181616",
--   cursor_bg = "#C8C093",
--   cursor_fg = "#C8C093",
--   cursor_border = "#C8C093",
--   selection_fg = "#C8C093",
--   selection_bg = "#2D4F67",
--
--   scrollbar_thumb = "#16161D",
--   split = "#16161D",
--
--   ansi = {
--     "#0D0C0C",
--     "#C4746E",
--     "#8A9A7B",
--     "#C4B28A",
--     "#8BA4B0",
--     "#A292A3",
--     "#8EA4A2",
--     "#C8C093",
--   },
--   brights = {
--     "#A6A69C",
--     "#E46876",
--     "#87A987",
--     "#E6C384",
--     "#7FB4CA",
--     "#938AA9",
--     "#7AA89F",
--     "#C5C9C5",
--   },
-- }

-- mellifluous dark
-- config.colors = {
--   foreground = "#C8C8C8",
--   background = "#151515",
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
--     "#863e7f",NormalNormal
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

config.freetype_interpreter_version = 35
config.freetype_load_flags = 'NO_HINTING'
config.freetype_load_target = 'Light'
config.dpi = 72
config.line_height = 1.1

config.enable_tab_bar = false

return config
