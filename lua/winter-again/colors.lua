local config = require("winter-again.config")

local M = {}

---@alias Hex string

---@class HSL
---@field h number
---@field s number
---@field l number

---@class RGB
---@field r number
---@field g number
---@field b number

--- Convert hex to RGB
---@param hex Hex
---@return RGB
function M.hex_to_rgb(hex)
    hex = hex:gsub("#", ""):lower()

    local rgb = {
        r = tonumber(hex:sub(1, 2), 16),
        g = tonumber(hex:sub(3, 4), 16),
        b = tonumber(hex:sub(5, 6), 16),
    }
    return rgb
end

--- Convert RGB color to HSL
---@param rgb RGB
---@return HSL
function M.rgb_to_hsl(rgb)
    local r = rgb.r / 255.0
    local g = rgb.g / 255.0
    local b = rgb.b / 255.0

    local c_min = math.min(r, g, b)
    local c_max = math.max(r, g, b)
    local chroma = c_max - c_min

    local h_prime
    if chroma == 0 then
        h_prime = 0
    elseif c_max == r then
        h_prime = ((g - b) / chroma) % 6
    elseif c_max == g then
        h_prime = (b - r) / chroma + 2
    elseif c_max == b then
        h_prime = (r - g) / chroma + 4
    end
    local hue = h_prime * 60

    local lightness = (c_min + c_max) / 2

    local saturation
    if lightness == 0 or lightness == 1 then
        saturation = 0
    else
        saturation = chroma / (1 - math.abs(2 * lightness - 1))
    end

    local hsl = {
        h = hue,
        s = saturation,
        l = lightness,
    }
    return hsl
end

--- Convert HSL color to RGB
---@param hsl HSL
---@return RGB
function M.hsl_to_rgb(hsl)
    local h = hsl.h
    local s = hsl.s
    local l = hsl.l

    local chroma = (1 - math.abs(2 * l - 1)) * s
    local h_prime = h / 60
    local x = chroma * (1 - math.abs(h_prime % 2 - 1))

    local r, g, b
    if 0 <= h_prime and h_prime < 1 then
        r, g, b = chroma, x, 0
    elseif 1 <= h_prime and h_prime < 2 then
        r, g, b = x, chroma, 0
    elseif 2 <= h_prime and h_prime < 3 then
        r, g, b = 0, chroma, x
    elseif 3 <= h_prime and h_prime < 4 then
        r, g, b = 0, x, chroma
    elseif 4 <= h_prime and h_prime < 5 then
        r, g, b = x, 0, chroma
    elseif 5 <= h_prime and h_prime < 6 then
        r, g, b = chroma, 0, x
    end

    local m = l - (chroma / 2)
    local rgb = {
        r = r + m,
        g = g + m,
        b = b + m,
    }
    return rgb
end

--- Convert HSL color to hex color
---@param hsl HSL
---@return string
function M.hsl_to_hex(hsl)
    local rgb = M.hsl_to_rgb(hsl)
    return ("#%02x%02x%02x"):format(rgb.r * 255, rgb.g * 255, rgb.b * 255)
end

--- Convert hex code color to HSL
---@param hex Hex
---@return HSL
function M.hex_to_hsl(hex)
    return M.rgb_to_hsl(M.hex_to_rgb(hex))
end

--- Modify hex color code saturation and lightness via HSL conversion
--- For example, hex_mod("#f0f0f0", 0, -0.5) would darken the hex code by 0.5
---@param hex Hex Hex code to modify
---@param saturation number Change in saturation. Saturation ranges [0, 1].
---@param lightness number Change in lightness. Lightness ranges [0, 1].
---@return string
local function hex_mod(hex, saturation, lightness)
    local hsl = M.hex_to_hsl(hex)
    hsl.s = math.min(1, math.max(0, hsl.s + saturation))
    hsl.l = math.min(1, math.max(0, hsl.l + lightness))

    return M.hsl_to_hex(hsl)
end

---@type table<string, string>
M.palette = {
    -- based on mountain fuji theme
    -- grayscale
    yoru = "#0f0f0f",
    kesseki = "#191919",
    iwa = "#262626",
    tetsu = "#393939",
    amagumo = "#4c4c4c",
    gin = "#767676",
    okami = "#a0a0a0",
    tsuki = "#bfbfbf",
    fuyu = "#cacaca",

    -- alphas
    ume = "#8f8aac",
    kosumosu = "#ac8aac",
    chikyu = "#aca98a",
    kaen = "#ac8a8c",
    aki = "#c6a679",
    mizu = "#8aacab",
    take = "#8aac8b",
    shinkai = "#8a98ac",
    usagi = "#e7e7e7",

    -- accents
    ajisai = "#a39ec4",
    sakura = "#c49ec4",
    suna = "#c4c19e",
    ichigo = "#c49ea0",
    yuyake = "#ceb188",
    sora = "#9ec3c4",
    kusa = "#9ec49f",
    kori = "#a5b4cb",
    yuki = "#f0f0f0",

    blue = "#7e97ab",
    -- bluelsf = "#7ba6de",
    -- bluewjsn = "#002f6c",
    green = "#778c73",
    moon = "#aeaed1",
    orange = "#c59a5f",
    red = "#b36d7c",
    yellow = "#ab9a78",
}

---@type table<string, string>
M.colors = {
    -- for testing
    -- Red = "#ff0000",
    -- Magenta = "#ff00ff",
    -- Lime = "#00ff00",

    none = "none",
    moon = hex_mod(M.palette.moon, config.opts.saturation, config.opts.lightness),

    fg = hex_mod(M.palette.fuyu, config.opts.saturation, config.opts.lightness),
    fg_mid = hex_mod(M.palette.tsuki, config.opts.saturation, config.opts.lightness),
    fg_dark = hex_mod(M.palette.okami, config.opts.saturation, config.opts.lightness),
    fg_comment = hex_mod(M.palette.amagumo, config.opts.saturation, config.opts.lightness),

    bg = hex_mod(M.palette.yoru, config.opts.saturation, config.opts.lightness),
    bg_float = hex_mod(M.palette.kesseki, config.opts.saturation, config.opts.lightness),
    bg_visual = hex_mod(M.palette.tetsu, config.opts.saturation, config.opts.lightness),
    cursor_line = hex_mod(M.palette.iwa, config.opts.saturation, config.opts.lightness),

    gray0 = hex_mod(M.palette.okami, config.opts.saturation, config.opts.lightness),
    gray1 = hex_mod(M.palette.gin, config.opts.saturation, config.opts.lightness),
    gray2 = hex_mod(M.palette.amagumo, config.opts.saturation, config.opts.lightness),
    gray3 = hex_mod(M.palette.tetsu, config.opts.saturation, config.opts.lightness),
    gray4 = hex_mod(M.palette.iwa, config.opts.saturation, config.opts.lightness),
    gray5 = hex_mod(M.palette.kesseki, config.opts.saturation, config.opts.lightness),

    purple = hex_mod(M.palette.ume, config.opts.saturation, config.opts.lightness),
    pink = hex_mod(M.palette.kosumosu, config.opts.saturation, config.opts.lightness),
    yellow = hex_mod(M.palette.chikyu, config.opts.saturation, config.opts.lightness),
    red = hex_mod(M.palette.red, config.opts.saturation, config.opts.lightness),
    red_diff = hex_mod(M.palette.red, config.opts.saturation, -0.8),
    orange = hex_mod(M.palette.aki, config.opts.saturation, config.opts.lightness),
    green = hex_mod(M.palette.green, config.opts.saturation, config.opts.lightness),
    green_diff = hex_mod(M.palette.green, config.opts.saturation, -0.75),
    blue = hex_mod(M.palette.blue, config.opts.saturation, config.opts.lightness),
    blue_diff = hex_mod(M.palette.blue, config.opts.saturation, -0.75),
}

return M
