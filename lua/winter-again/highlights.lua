local colors = require("winter-again.colors").colors
local config = require("winter-again.config")
local sets = require("winter-again.groups")
local kinds = require("winter-again.groups.kinds")

local M = {}

---@param group string
---@param hl table
local function set_highlight(group, hl)
    vim.api.nvim_set_hl(0, group, hl)
end

function M._set_highlights()
    -- TODO: ability to disable plugins in config?
    local highlights = {}
    for _, set in pairs(sets) do
        for group, hl in pairs(set) do
            highlights[group] = hl
        end
    end

    local hl_overrides = config.opts.hl_overrides
    if hl_overrides ~= nil then
        for group, hl in pairs(hl_overrides(colors)) do
            highlights[group] = vim.tbl_deep_extend("force", highlights[group] or {}, hl)
        end
    end

    for group, hl in pairs(highlights) do
        set_highlight(group, hl)
    end

    kinds.hl_kinds(highlights)
end

return M
