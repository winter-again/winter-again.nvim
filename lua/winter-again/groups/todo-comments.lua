local colors = require("winter-again.colors").colors

local M = {
    TodoFgTodo = { fg = colors.purple },
    TodoBgTodo = { fg = colors.bg, bg = colors.purple, bold = true },
    TodoFgNote = { fg = colors.gray1 },
    TodoBgNote = { fg = colors.bg, bg = colors.gray1, bold = true },
    TodoFgWarn = { fg = colors.yellow },
    TodoBgWarn = { fg = colors.bg, bg = colors.yellow, bold = true },
    TodoFgFix = { fg = colors.red },
    TodoBgFix = { fg = colors.bg, bg = colors.red, bold = true },
}

return M
