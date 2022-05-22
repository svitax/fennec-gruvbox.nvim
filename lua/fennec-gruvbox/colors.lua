local palette = {
  -- og_background = "#282828",
  -- og_background_dark = "#242424",
  -- og_soft_yellow = "#EEBD35",
  -- og_soft_green = "#98971a",
  -- og_bright_yellow = "#fabd2f",
  -- og_orange = "#d65d0e",
  -- og_red = "#fb4934",
  -- og_error_red = "#cc241d",
  -- og_magenta = "#b16286",
  -- og_pink = "#D4879C",
  -- og_light_blue = "#7fa2ac",
  -- og_blue_gray = "#458588",
  -- og_clean_green = "#8ec07c",
  dark = "#202020",
  foreground = "#ebdbb2",
  background = "#222526",
  background_dark = "#202020",
  bg_light = "#32302f",

  line_fg = "#7c6f64",
  line_active_fg = "#d4be98",
  line_bg1 = "#2b2e2f",
  line_bg2 = "#3b3e3f",
  line_bg3 = "#313435",

  statusline_bg = "#252829",
  light_bg1 = "#2d3139",
  light_bg2 = "#262a32",

  grey = "#46494a",
  grey_fg1 = "#5d6061",
  grey_fg2 = "#5b5e5f",

  medium_gray = "#504945",
  comment = "#665c54",
  gray = "#DEDEDE",
  soft_yellow = "#d1b171",
  soft_green = "#a9b665",
  bright_yellow = "#d6b676",
  orange = "#e78a4e",
  red = "#ec6b64",
  error_red = "#ec6b64",
  magenta = "#ce8196",
  pink = "#d3869b",
  light_blue = "#7daea3",
  dark_gray = "#83a598",
  blue_gray = "#7fa2ac",
  forest_green = "#689d6a",
  clean_green = "#86b17f",
  milk = "#E7D7AD",
  none = "NONE",
}

gruvchad = {
  white = "#c7b89d",
  darker_black = "#1e2122",
  black = "#3c3836",
  black2 = "#282b2c",
  one_bg = "#2b2e2f",
  one_bg2 = "#3b3e3f",
  one_bg3 = "#313435",
  grey = "#46494a",
  grey_fg = "#5d6061",
  grey_fg2 = "#5b5e5f",
  light_grey = "#585b5c",
  red = "#ec6b64",
  baby_pink = "#ce8196",
  pink = "#ff75a0",
  line = "#2c2f30", -- for lines like vertsplit
  green = "#89b482",
  vibrant_green = "#a9b665",
  nord_blue = "#6f8faf",
  blue = "#6d8dad",
  yellow = "#d6b676",
  sun = "#d1b171",
  purple = "#b4bbc8",
  dark_purple = "#cc7f94",
  teal = "#749689",
  orange = "#e78a4e",
  cyan = "#82b3a8",
  statusline_bg = "#252829",
  lightbg = "#2d3139",
  lightbg2 = "#262a32",
  pmenu_bg = "#89b482",
  folder_bg = "#6d8dad",
}

-- these are backgrounds
palette.diff = {
  add = "#26332c",
  change = "#273842",
  delete = "#572E33",
  text = "#314753",
}

local M = {}

function M.config(config)
  config = config or require("fennec-gruvbox.config")
  local intensity_map = {
    ["dark"] = {
      dark = "#161616",
      background = "#202020",
      background_dark = "#161616",
    },
    ["medium"] = {
      background = palette.background,
      background_dark = palette.background_dark,
    },
  }

  local colors = palette
  local background = config.background_color or palette.background
  if intensity_map[background] then
    colors = vim.tbl_extend("force", colors, intensity_map[background])
  end

  if config.transparent_mode then
    transparent = {
      background = palette.none,
      background_dark = palette.none
    }
    colors = vim.tbl_extend("force", colors, { background = palette.none, background_dark = palette.none })
  end
  return colors
end

return M
