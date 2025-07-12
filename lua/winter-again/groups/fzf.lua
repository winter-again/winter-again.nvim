local colors = require("winter-again.colors").colors

local M = {
    FzfLuaNormal = { fg = colors.fg, bg = colors.bg_float },
    FzfLuaFzfPrompt = { fg = colors.purple, bg = colors.bg_float },
    FzfLuaHeaderText = { fg = colors.green, bg = colors.bg_float },
    FzfLuaHeaderBind = { fg = colors.blue, bg = colors.bg_float },
    FzfLuaCursorLine = { link = "CursorLine" },
    FzfLuaCursorLineNr = { link = "CursorLineNr" },

    -- NOTE: these don't apply to rg output in live_grep
    FzfLuaPathLineNr = { fg = colors.green },
    FzfLuaPathColNr = { fg = colors.yellow },
}

return M
