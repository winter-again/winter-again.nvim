local colors = require("winter-again.colors").colors

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
    Field = "@property",
    File = "Normal",
    Folder = "Directory",
    Function = "@function",
    Interface = "@lsp.type.interface",
    Key = "@property",
    Keyword = "@lsp.type.keyword",
    Method = "@method",
    Module = "@module",
    Namespace = "@module",
    Null = "@constant.builtin",
    Number = "@number",
    Object = "@constant",
    Operator = "@operator",
    Package = "@module",
    Property = "@property",
    Reference = "@markup.link",
    Snippet = "Conceal",
    String = "@string",
    Struct = "@lsp.type.struct",
    Unit = "@lsp.type.struct",
    Text = "Normal",
    TypeParameter = "@lsp.type.typeParameter",
    Variable = "@variable",
    Value = "@string",
}
local cmp_plugins = {
    "BlinkCmpKind%s",
    -- "CmpItemKind%s",
}

local M = {}

function M.set_kind_highlights()
    for kind, link in pairs(kinds) do
        for _, plugin in pairs(cmp_plugins) do
            -- hacky because relies on linked highlight being set first
            local hl = plugin:format(kind)
            local hl_link = vim.api.nvim_get_hl(0, { name = link, link = false })
            vim.api.nvim_set_hl(0, hl, { fg = hl_link.fg, bg = colors.none })
        end
        -- keep in sync with lspkind
        -- local base = "LspKind" .. kind
        -- M.sets[base] = { link = link }
    end
end

return M
