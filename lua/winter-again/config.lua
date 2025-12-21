local M = {}

---@class Options
---@field transparent? boolean
---@field saturation? number
---@field lightness? number
---@field text_styles? TextStyles
---@field hl_overrides? fun(highlights: table<string, vim.api.keyset.highlight>, colors: table<string, string>)

---@class TextStyles
---@field booleans? TextStyle
---@field comments? TextStyle
---@field floats? TextStyle
---@field functions? TextStyle
---@field numbers? TextStyle
---@field keywords? TextStyle
---@field statements? TextStyle
---@field types? TextStyle

---@class TextStyle
---@field bold? boolean
---@field standout? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field underdouble? boolean
---@field underdotted? boolean
---@field underdashed? boolean
---@field strikethrough? boolean
---@field italic? boolean
---@field reverse? boolean

---@type Options
local defaults = {
    transparent = true,
    saturation = 0,
    lightness = 0,
    text_styles = {
        booleans = { italic = true },
        comments = { italic = true },
        floats = { italic = true },
        functions = { bold = true },
        numbers = { italic = true },
        keywords = { bold = true },
        types = { italic = true },
    },
    hl_overrides = nil,
}

---@type Options
M.opts = defaults

--- Load colorscheme configuration and handle user overrides
---@param opts? Options
function M.load_config(opts)
    M.opts = vim.tbl_deep_extend("force", M.opts, opts)
end

return M
