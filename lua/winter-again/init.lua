local M = {}

-- NOTE: order of execution:
-- M.setup()
-- config.load_config()
-- colors/winter-again.lua: M.load()
-- highlights.set_highlights()

---@param opts? Options
function M.setup(opts)
    opts = opts or {}
    require("winter-again.config").load_config(opts)
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
