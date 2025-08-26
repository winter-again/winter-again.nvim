local colors = require("winter-again.colors").colors

local M = {
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.blue },
    GitSignsDelete = { fg = colors.red },

    GitSignsAddPreview = { fg = colors.fg_dark, bg = colors.green_diff },
    GitSignsAddInline = { fg = colors.bg, bg = colors.green },

    GitSignsChangePreview = { fg = colors.fg_dark, bg = colors.blue_diff },
    GitSignsChangeInline = { fg = colors.bg, bg = colors.blue },

    GitSignsDeletePreview = { fg = colors.fg_dark, bg = colors.red_diff },
    GitSignsDeleteInline = { fg = colors.bg, bg = colors.red },
}

return M
