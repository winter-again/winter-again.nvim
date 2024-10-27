local colors = require("winter-again.colors")

local M = {
    normal = {
        a = { fg = colors.gray0, bg = colors.gray2, gui = "bold" },
        b = { fg = colors.gray0, bg = colors.gray3 },
        c = { fg = colors.fg, bg = colors.gray3 },
    },
    insert = {
        a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
        b = { fg = colors.gray0, bg = colors.gray3 },
        c = { fg = colors.fg, bg = colors.gray3 },
    },
    visual = {
        a = { fg = colors.bg, bg = colors.green, gui = "bold" },
        b = { fg = colors.gray0, bg = colors.gray3 },
        c = { fg = colors.fg, bg = colors.gray3 },
    },
    replace = {
        a = { fg = colors.bg, bg = colors.search, gui = "bold" },
        b = { fg = colors.gray0, bg = colors.gray3 },
        c = { fg = colors.fg, bg = colors.gray3 },
    },
    command = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        b = { fg = colors.gray0, bg = colors.gray3 },
        c = { fg = colors.fg, bg = colors.gray3 },
    },
    inactive = {
        a = { fg = colors.gray1, bg = colors.bg, gui = "bold" },
        b = { fg = colors.gray1, bg = colors.bg },
        c = { fg = colors.gray1, bg = colors.bg },
    },
}

return M
