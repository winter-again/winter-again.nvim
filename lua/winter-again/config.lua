local M = {}

---@class Config
---@field transparent? boolean
local default_opts = {
    transparent = true,
}

---@type Config
M.opts = {}

---@param opts Config
function M._load(opts)
    M.opts = vim.tbl_deep_extend("force", default_opts, opts)
end

return M
