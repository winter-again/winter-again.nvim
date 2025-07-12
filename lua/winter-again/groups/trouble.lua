local colors = require("winter-again.colors").colors
local config = require("winter-again.config")

local M = {
    TroubleText = { fg = colors.purple },
    TroubleCount = { fg = colors.bg, bg = colors.purple },
    TroubleNormal = { bg = config.opts.transparent and colors.none or colors.bg },
    TroubleNormalNC = { bg = config.opts.transparent and colors.none or colors.bg },
}

return M
