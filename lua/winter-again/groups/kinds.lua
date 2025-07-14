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

---@param highlights table
function M.hl_kinds(highlights)
    for kind, link in pairs(kinds) do
        for _, plugin in pairs(cmp_plugins) do
            highlights[plugin:format(kind)] = { link = link }
        end
        -- keep in sync with lspkind
        -- local base = "LspKind" .. kind
        -- M.sets[base] = { link = link }
    end
end

return M
