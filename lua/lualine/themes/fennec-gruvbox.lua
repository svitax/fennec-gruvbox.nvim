-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local c = require("fennec-gruvbox.colors").config()

return {
  normal = {
    -- a = { bg = c.light_blue, fg = c.dark, gui = "bold" },
    a = { bg = c.line_bg, fg = c.light_blue, gui = "bold" },
    b = { bg = c.line_bg, fg = c.light_blue },
    c = { bg = c.line_bg, fg = c.comment },
  },
  insert = {
    a = { bg = c.bright_yellow, fg = c.dark, gui = "bold" },
    b = { bg = c.line_bg, fg = c.bright_yellow },
    c = { bg = c.line_bg, fg = c.comment },
  },
  visual = {
    a = { bg = c.milk, fg = c.dark, gui = "bold" },
    b = { bg = c.line_bg, fg = c.milk },
    c = { bg = c.line_bg, fg = c.comment },
  },
  replace = {
    a = { bg = c.error_red, fg = c.dark, gui = "bold" },
    b = { bg = c.line_bg, fg = c.error_red },
    c = { bg = c.line_bg, fg = c.comment },
  },
  command = {
    a = { bg = c.soft_green, fg = c.dark, gui = "bold" },
    b = { bg = c.line_bg, fg = c.soft_green },
    c = { bg = c.line_bg, fg = c.comment },
  },
  inactive = {
    a = { bg = c.background, fg = c.gray, gui = "bold" },
    b = { bg = c.background, fg = c.gray },
    c = { bg = c.background, fg = c.gray },
  },
}
