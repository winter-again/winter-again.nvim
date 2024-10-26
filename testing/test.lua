local M = {}

function M.hello(name)
    local msg = "Hello, "
    local z = 5 + 10 * 7 / 7 - 8
    print(z)
    local bar = true
    if bar then
        local st = "foo"
    end
    return msg .. name
end

M.hello()

return M
