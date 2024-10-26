local M = {}

function M.hello(name)
    -- todo: something
    -- note: something else
    -- WARN: this is dangerous
    local msg = "Hello, "
    local z = 5 + 10 * 7 / 7 - 8
    print(z)
    print({})

    local bar = true
    local baz = false
    if bar then
        local st = "foo"
    elseif not baz then
        local st = "baz"
    end
    return msg .. name
end

M.hello()

local function get_conform()
    -- local lsp_format = require('conform.lsp_format')
    local formatters = require("conform").list_formatters(0)
    local output = ""
    if not vim.tbl_isempty(formatters) then
        local names = {}
        for _, formatter in ipairs(formatters) do
            table.insert(names, formatter.name)
        end
        output = table.concat(names, ", ")
        output = string.format("[%s]", output)
    end
    return output
end

get_conform()

return M
