local colors = require("winter-again.colors").colors

local M = {
    NvimTreeNormal = { fg = colors.fg_dark, bg = colors.bg_float },
    NvimTreeNormalFloat = { fg = colors.fg_dark, bg = colors.bg_float },
    NvimTreeNormalNC = { fg = colors.fg_dark, bg = colors.bg_float },
    NvimTreeIndentMarker = { fg = colors.fg_comment },
    NvimTreeGitDirty = { fg = colors.blue },
    NvimTreeGitNew = { fg = colors.green },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeGitIgnored = { fg = colors.fg_dark },
    NvimTreeFolderIcon = { fg = colors.purple },
    NvimTreeWinSeparator = { fg = colors.fg_dark, bg = colors.bg_float },
    NvimTreeRootFolder = { fg = colors.fg_dark, bold = true },
    NvimTreeSpecialFile = { fg = colors.fg_dark, underline = true },
    NvimTreeSymlink = { fg = colors.green },
    NvimTreeOpenedFile = { fg = colors.blue },
    NvimTreeOpenedFolderName = { fg = colors.blue },
    NvimTreeImageFile = { fg = colors.yellow },
    NvimTreeFolderName = { fg = colors.fg_dark },
    NvimTreeWindowPicker = { fg = colors.bg, bg = colors.blue },
}

return M
