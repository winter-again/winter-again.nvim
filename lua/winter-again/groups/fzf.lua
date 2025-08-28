local colors = require("winter-again.colors").colors

local M = {
    FzfLuaNormal = { fg = colors.fg, bg = colors.bg_float },
    FzfLuaHeaderBind = { fg = colors.green, bg = colors.bg_float },
    FzfLuaHeaderText = { fg = colors.green, bg = colors.bg_float },

    -- NOTE: these don't apply to rg output in live_grep
    FzfLuaPathLineNr = { fg = colors.green },
    FzfLuaBufFlagCur = { fg = colors.purple },
    FzfLuaBufFlagAlt = { fg = colors.blue },
    FzfLuaPathColNr = { fg = colors.yellow },
}

return M
