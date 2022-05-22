local palette = {
  dark = "#202020",
  foreground = "#ebdbb2",
  -- og_background = "#282828",
  background = "#222526",
  -- og_background_dark = "#242424",
  background_dark = "#202020",
  bg_light = "#32302f",
  medium_gray = "#504945",
  comment = "#665c54",
  gray = "#DEDEDE",
  -- og_soft_yellow = "#EEBD35",
  soft_yellow = "#d1b171",
  -- og_soft_green = "#98971a",
  soft_green = "#a9b665",
  -- og_bright_yellow = "#fabd2f",
  bright_yellow = "#d6b676",
  -- og_orange = "#d65d0e",
  orange = "#e78a4e",
  -- og_red = "#fb4934",
  red = "#ec6b64",
  -- og_error_red = "#cc241d",
  error_red = "#ec6b64",
  -- og_magenta = "#b16286",
  magenta = "#ce8196",
  -- og_pink = "#D4879C",
  pink = "#d3869b",
  -- og_light_blue = "#7fa2ac",
  light_blue = "#7daea3",
  dark_gray = "#83a598",
  -- og_blue_gray = "#458588",
  blue_gray = "#7fa2ac",
  forest_green = "#689d6a",
  -- og_clean_green = "#8ec07c",
  clean_green = "#86b17f",
  milk = "#E7D7AD",
  none = "NONE",
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
