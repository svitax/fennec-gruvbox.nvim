local util = require("fennec-gruvbox.util")
local theme = require("fennec-gruvbox.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
