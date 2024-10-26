local util = require("winter-again.util")
local theme = require("winter-again.highlights")

local M = {}

function M.load()
    -- load theme
    -- theme param is a function that returns
    -- highlights table
    util.load()
end

return M
