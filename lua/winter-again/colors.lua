local palette = {
    -- mountain fuji theme
    yuki = "#f0f0f0", -- fg
    tsuki = "#bfbfbf",
    okami = "#a0a0a0",
    gin = "#767676",
    amagumo = "#4c4c4c",
    tetsu = "#393939",
    iwa = "#262626",
    kesseki = "#191919",
    yoru = "#0f0f0f",

    ume = "#8f8aac",
    kosumosu = "#ac8aac",
    chikyu = "#aca98a",
    yellow = "#ab9a78",
    kaen = "#ac8a8c",
    red = "#b36d7c",
    aki = "#c6a679",
    yuyake = "#ceb188",
    orange = "#c59a5f",
    mizu = "#8aacab",
    cyan = "#708090", -- test
    -- cyan = "#7b9695", -- test
    take = "#8aac8b",
    green = "#789978",
    shinkai = "#8a98ac",
    blue = "#7e97ab",
    -- bluelsf = "#7ba6de",
    -- bluewjsn = "#002f6c",
}

local hex_chars = "0123456789abcdef"

---@param hex string
---@return table
local function hex_to_rgb(hex)
    hex = string.lower(hex):gsub("#", "")
    local rgb = {}
    for i = 0, 2 do
        local char0 = string.sub(hex, 2 * i + 1, 2 * i + 1)
        local char1 = string.sub(hex, 2 * i + 2, 2 * i + 2)
        local num0 = string.find(hex_chars, char0) - 1
        local num1 = string.find(hex_chars, char1) - 1
        table.insert(rgb, num0 * 16 + num1)
    end
    return rgb
end

local M = {
    none = "none",
    Red = "#ff0000",
    Magenta = "#ff00ff",
    Lime = "#00ff00",

    fg = palette.yuki,
    fg_mid = palette.tsuki,
    fg_dark = palette.okami,
    fg_comment = palette.amagumo,

    bg = palette.yoru,
    bg_float = palette.kesseki,
    bg_visual = palette.tetsu,
    cursor_line = palette.iwa,

    gray0 = palette.okami,
    gray1 = palette.gin,
    gray2 = palette.amagumo,
    gray3 = palette.tetsu,
    gray4 = palette.iwa,
    gray5 = palette.kesseki,

    purple = palette.ume,
    pink = palette.kosumosu,
    yellow = palette.yellow,
    red = palette.red,
    orange = palette.orange,
    cyan = palette.cyan,
    green = palette.green,
    blue = palette.blue,
}

return M
