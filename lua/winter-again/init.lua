local config = require("winter-again.config")

local M = {}

-- NOTE: M.setup() called, then colors/winter-again.lua which runs M.load()

---@param opts? Options
function M.setup(opts)
    opts = opts or {}
    config.load_config(opts)
end

function M.load()
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "winter-again"
    vim.opt.termguicolors = true

    -- NOTE: must require here to properly load config
    require("winter-again.highlights").set_highlights()
end

return M
