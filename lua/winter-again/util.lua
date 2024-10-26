local highlights = require("winter-again.highlights")

local M = {}

---@param group string
---@param hl table
function M.highlight(group, hl)
    vim.api.nvim_set_hl(0, group, hl)
end

---@param syntax table
-- function M.syntax(syntax)
--     for group, colors in pairs(syntax) do
--         M.highlight(group, colors)
--     end
-- end

-- here theme is the highlights table from theme.lua
function M.load()
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.opt.termguicolors = true -- color setting; I already set to true in my config
    vim.g.colors_name = "winter-again" -- set name of this colorscheme

    -- checks if vim.treesitter.highlighter.hl_map is nil or not
    -- then iterates through a defaults table of treesitter param "@..."
    -- and if that group spec isn't already defined in theme.lua
    -- will specify it here (there's a bunch specified in treesitter.lua module)
    -- if ts.new_style() then
    --     for group, colors in pairs(ts.defaults) do
    --         if not theme.highlights[group] then
    --             M.highlight(group, colors)
    --         end
    --     end
    -- end
    -- any autocmds

    for _, hl_set in ipairs({ "editor", "syntax", "lsp", "treesitter", "plugins" }) do
        for group, colors in pairs(highlights[hl_set]) do
            M.highlight(group, colors)
        end
    end
end

return M
