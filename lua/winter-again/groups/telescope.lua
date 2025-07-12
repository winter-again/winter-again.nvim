local colors = require("winter-again.colors").colors

-- telescope (see: https://github.com/nvim-telescope/telescope.nvim/blob/85922dde3767e01d42a08e750a773effbffaea3e/plugin/telescope.lua)
local M = {
    -- selected items within picker
    TelescopeSelection = { link = "Visual" },
    TelescopeSelectionCaret = { link = "TelescopeSelection" },
    TelescopeMultiSelection = { fg = colors.green },
    TelescopeMultiIcon = { fg = colors.green },

    -- floating windows
    TelescopeNormal = { fg = colors.fg_dark, bg = colors.bg_float },
    TelescopePreviewNormal = { bg = colors.bg },
    TelescopePromptNormal = { bg = colors.bg },
    TelescopeResultsNormal = { link = "TelescopeNormal" },

    -- borders
    TelescopeBorder = { bg = colors.bg_float },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopePreviewNormal" },

    -- titles
    TelescopeTitle = { fg = colors.bg, bg = colors.purple },
    TelescopePromptTitle = { link = "TelescopeTitle" },
    TelescopeResultsTitle = {},
    TelescopePreviewTitle = { fg = colors.bg, bg = colors.blue },

    TelescopePromptCounter = { fg = colors.blue, bg = colors.bg }, -- result counter
    TelescopeMatching = { fg = colors.purple }, -- matched chars
}

return M
