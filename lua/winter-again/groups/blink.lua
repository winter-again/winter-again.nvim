local colors = require("winter-again.colors").colors

local M = {
    BlinkCmpMenu = { bg = colors.bg_float }, -- The completion menu window
    BlinkCmpMenuBorder = { bg = colors.bg_float }, -- The completion menu window border
    BlinkCmpMenuSelection = { bg = colors.bg_visual }, -- The completion menu window selected item
    BlinkCmpScrollBarThumb = { link = "PmenuThumb" }, -- The scrollbar thumb
    BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
    BlinkCmpLabel = { fg = colors.fg_dark, bg = colors.none }, -- Label of the completion item
    BlinkCmpLabelDeprecated = { fg = colors.fg_dark, strikethrough = true }, -- Deprecated label of the completion item
    BlinkCmpLabelMatch = { fg = colors.purple, bg = colors.none, bold = true }, -- (Apparently unused but works) Label of the completion item when it matches the query
    BlinkCmpLabelDetail = { fg = colors.fg_dark }, -- Label description of the completion item
    BlinkCmpLabelDescription = { fg = colors.fg_dark }, -- Label description of the completion item
    -- BlinkCmpKind = { fg = colors.fg_dark }, -- Kind icon/text of the completion item
    BlinkCmpSource = { fg = colors.fg_dark }, -- source of the completion item
    BlinkCmpGhostText = { link = "NonText" }, -- preview item with ghost text
    BlinkCmpDoc = { fg = colors.fg_dark, bg = colors.bg_float }, -- documentation window
    BlinkCmpDocBorder = { bg = colors.bg_float }, -- documentation window border
    BlinkCmpDocSeparator = { bg = colors.bg_float }, -- the documentation separator between doc and detail
    BlinkCmpDocCursorLine = { link = "CursorLine" }, -- doc window cursorline
    BlinkSignatureHelp = { bg = colors.bg_float }, -- signature help window
    BlinkSignatureHelpBorder = { bg = colors.bg_float }, -- signature help window border
    BlinkCmpSignatureHelpActiveParameter = { bg = colors.bg_visual, bold = true }, -- active param of the signature help
}

return M
