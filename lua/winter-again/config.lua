local M = {}

---@class Options
---@field transparent? boolean
---@field saturation? number
---@field brightness? number
---@field text_styles? TextStyles
---@field hl_overrides? fun(colors: table): table<string, table>

---@class TextStyles
---@field booleans? Highlight
---@field comments? Highlight
---@field floats? Highlight
---@field functions? Highlight
---@field numbers? Highlight
---@field keywords? Highlight
---@field statements? Highlight
---@field types? Highlight

---@class Highlight
---@field fg? string
---@field bg? string
---@field sp? integer
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
    brightness = 0,
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

---@param opts? Options
function M.load_config(opts)
    M.opts = vim.tbl_deep_extend("force", M.opts, opts or {})
end

return M
