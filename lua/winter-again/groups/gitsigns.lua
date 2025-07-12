local colors = require("winter-again.colors").colors

local M = {
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.blue },
    GitSignsDelete = { fg = colors.red },
    GitSignsAddPreview = { fg = colors.green, bg = colors.bg_float },
    GitSignsChangePreview = { fg = colors.blue, bg = colors.bg_float },
    GitSignsDeletePreview = { fg = colors.red, bg = colors.gray2 },
}

return M
