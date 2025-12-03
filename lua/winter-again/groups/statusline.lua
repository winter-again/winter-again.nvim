local colors = require("winter-again.colors").colors

-- if mode:find("NORMAL") then
--     label = "Normal"
-- elseif mode:find("PENDING") then
--     label = "Pending"
-- elseif mode:find("VISUAL") or mode:find("^V\\-") then
--     label = "Visual"
-- elseif mode:find("INSERT") or mode:find("SELECT") then
--     label = "Insert"
-- elseif mode:find("COMMAND") or mode:find("TERMINAL") or mode:find("EX") then
--     label = "Command"
-- end

local M = {
    Statusline = { fg = colors.fg, bg = colors.bg }, -- Status line of current window
    StatusLineNC = { link = "StatusLine" }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    StatusLineTerm = { link = "StatusLine" }, -- Status line of terminal window

    StatuslineModeNormal = { fg = colors.gray0, bg = colors.gray4, bold = true },
    StatuslineModeInsert = { fg = colors.bg, bg = colors.purple, bold = true },
    StatuslineModeVisual = { fg = colors.bg, bg = colors.green, bold = true },
    StatuslineModeCommand = { fg = colors.bg, bg = colors.blue, bold = true },
    StatuslineModePending = { link = "StatuslineModeNormal" },
    StatuslineModeOther = { link = "StatuslineModeNormal" },

    StatuslineGitHead = { fg = colors.gray0, bg = colors.gray3, bold = true },

    StatuslineSectionInner = { fg = colors.gray0, bg = colors.gray3 },
    StatuslineSectionOuter = { fg = colors.gray0, bg = colors.gray4 },
}

return M
