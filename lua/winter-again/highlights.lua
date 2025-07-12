local colors = require("winter-again.colors").colors
local config = require("winter-again.config")
local sets = require("winter-again.groups")

local M = {}

---@param group string
---@param hl table
local function set_highlight(group, hl)
    vim.api.nvim_set_hl(0, group, hl)
end

---@param highlights table
local function hl_kinds(highlights)
    -- TODO: put this in sep module?
    local kinds = {
        Array = "@punctuation.bracket",
        Boolean = "@boolean",
        Class = "@type",
        Color = "Special",
        Constant = "@constant",
        Constructor = "@constructor",
        Enum = "@lsp.type.enum",
        EnumMember = "@lsp.type.enumMember",
        Event = "Special",
        Field = "@field",
        File = "Normal",
        Folder = "Directory",
        Function = "@function",
        Interface = "@lsp.type.interface",
        Key = "@field",
        Keyword = "@lsp.type.keyword",
        Method = "@method",
        Module = "@namespace",
        Namespace = "@namespace",
        Null = "@constant.builtin",
        Number = "@number",
        Object = "@constant",
        Operator = "@operator",
        Package = "@namespace",
        Property = "@property",
        Reference = "@text.reference",
        Snippet = "Conceal",
        String = "@string",
        Struct = "@lsp.type.struct",
        Unit = "@lsp.type.struct",
        Text = "@text",
        TypeParameter = "@lsp.type.typeParameter",
        Variable = "@variable",
        Value = "@string",
    }
    local kind_groups = {
        "BlinkCmpKind%s",
        -- "CmpItemKind%s",
    }

    for kind, link in pairs(kinds) do
        for _, plugin in pairs(kind_groups) do
            highlights[plugin:format(kind)] = { link = link }
        end
        -- keep in sync with lspkind
        -- local base = "LspKind" .. kind
        -- M.sets[base] = { link = link }
    end
end

function M._set_highlights()
    local hl_overrides = config.opts.hl_overrides

    -- TODO: ability to disable plugins in config?
    local highlights = {}
    for _, set in pairs(sets) do
        for group, hl in pairs(set) do
            highlights[group] = hl
        end
    end

    if hl_overrides ~= nil then
        hl_overrides(highlights, colors)
    end

    for group, hl in pairs(highlights) do
        set_highlight(group, hl)
    end

    hl_kinds(highlights)
end

return M
