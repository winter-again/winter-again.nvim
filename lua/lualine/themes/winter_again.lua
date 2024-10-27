local colors = require("winter-again.colors")

local M = {
    normal = {
        a = { fg = colors.gray0, bg = colors.gray2, gui = "bold" },
        b = { fg = colors.gray1, bg = colors.gray5 },
        c = { fg = colors.fg, bg = colors.gray5 },
    },
    insert = {
        a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
        b = { fg = colors.gray1, bg = colors.gray5 },
        c = { fg = colors.fg, bg = colors.gray5 },
    },
    visual = {
        a = { fg = colors.bg, bg = colors.green, gui = "bold" },
        b = { fg = colors.gray1, bg = colors.gray5 },
        c = { fg = colors.fg, bg = colors.gray5 },
    },
    replace = {
        a = { fg = colors.bg, bg = colors.search, gui = "bold" },
        b = { fg = colors.gray1, bg = colors.gray5 },
        c = { fg = colors.fg, bg = colors.gray5 },
    },
    command = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        b = { fg = colors.gray1, bg = colors.gray5 },
        c = { fg = colors.fg, bg = colors.gray5 },
    },
    inactive = {
        a = { fg = colors.gray1, bg = colors.bg, gui = "bold" },
        b = { fg = colors.gray1, bg = colors.gray5 },
        c = { fg = colors.gray1, bg = colors.gray5 },
    },
}

return M
