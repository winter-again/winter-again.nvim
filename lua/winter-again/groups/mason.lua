local colors = require("winter-again.colors").colors

local M = {
    MasonNormal = { fg = colors.fg, bg = colors.bg_float },
    MasonHeader = { fg = colors.bg, bg = colors.purple },
    MasonHighlight = { fg = colors.green },
    MasonHighlightBlock = { fg = colors.green },
    MasonHighlightBlockBold = { fg = colors.bg, bg = colors.purple },
    MasonHighlightSecondary = { fg = colors.green },
    MasonHighlightBlockSecondary = { fg = colors.bg, bg = colors.blue },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg, bg = colors.blue },
    MasonHeaderSecondary = { fg = colors.bg, bg = colors.blue },
    MasonMuted = { fg = colors.gray1, bg = colors.bg_float },
    MasonMutedBlock = { fg = colors.gray1, bg = colors.gray3 },
}

return M
