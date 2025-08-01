---@class Config
---@field transparent? boolean
---@field saturation? number
---@field brightness? number
---@field text_styles? TextStyles
---@field hl_overrides? fun(colors: table): table<string, table>

---@class TextStyles
---@field booleans? HlDefn
---@field comments? HlDefn
---@field floats? HlDefn
---@field functions? HlDefn
---@field numbers? HlDefn
---@field keywords? HlDefn
---@field statements? HlDefn
---@field types? HlDefn

---@class HlDefn
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

local M = {}

---@type Config
local default_opts = {
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
    hl_overrides = function()
        return {}
    end,
}

---@type Config
M.opts = {}

---@param opts Config
function M._load(opts)
    M.opts = vim.tbl_deep_extend("force", default_opts, opts)
end

return M
