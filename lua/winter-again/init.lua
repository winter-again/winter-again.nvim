local config = require("winter-again.config")

local M = {}

function M._load()
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "winter-again"
    vim.opt.termguicolors = true

    require("winter-again.highlights")._load()
end

---@param opts? Config
function M.setup(opts)
    opts = opts or {}
    config._load(opts)
end

return M
