local colors = require("winter-again.colors").colors

local M = {
    CmpItemAbbr = { fg = colors.fg_dark }, -- unmatched characters of each completion field
    CmpItemAbbrDeprecated = { fg = colors.fg_comment, strikethrough = true }, -- unmatchedd characters of each deprecated completion field
    CmpItemAbbrMatch = { fg = colors.purple, bold = true }, -- matched characters of each completion field
    CmpItemAbbrMatchFuzzy = { fg = colors.blue }, -- fuzzy-matched characters of each completion field
    CmpItemKind = { fg = colors.fg }, -- kind of the field (the symbol after each completion option)
    CmpItemMenu = { fg = colors.fg_dark }, -- menu field's higlight group (cmp source in brackets)
}

return M
