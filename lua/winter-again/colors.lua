local config = require("winter-again.config")

---@class HSL
---@field h number
---@field s number
---@field l number

---@class RGB
---@field r number
---@field g number
---@field b number

local M = {}

local hex_chars = "0123456789abcdef"

--- Converts hex color code to RGB
---@param hex string
---@return RGB
local function hex_to_rgb(hex)
    hex = string.lower(hex):gsub("#", "")
    local keys = { "r", "g", "b" }
    local rgb = {}
    for i = 0, 2 do
        local char0 = string.sub(hex, 2 * i + 1, 2 * i + 1)
        local char1 = string.sub(hex, 2 * i + 2, 2 * i + 2)
        local num0 = string.find(hex_chars, char0) - 1
        local num1 = string.find(hex_chars, char1) - 1
        rgb[keys[i + 1]] = num0 * 16 + num1
    end
    return rgb
end

--- Converts RGB color code to HSL
---@param rgb RGB
---@return HSL
local function rgb_to_hsl(rgb)
    local hsl = {}
    local r = rgb.r / 255
    local g = rgb.g / 255
    local b = rgb.b / 255

    local c_min = math.min(r, g, b)
    local c_max = math.max(r, g, b)
    local chroma = c_max - c_min

    local hue
    if chroma == 0 then
        hue = 0
    else
        if c_max == r then
            -- hue = math.fmod((g - b) / chroma, 6)
            if g < b then
                hue = (g - b) / chroma + 6
            else
                hue = (g - b) / chroma
            end
        elseif c_max == g then
            hue = (b - r) / chroma + 2
        elseif c_max == b then
            hue = (r - g) / chroma + 4
        end
    end
    hsl.h = hue * 60

    -- HSL bi-hexcone model = avg of largest and smallest
    local lightness = (c_max + c_min) / 2
    hsl.l = lightness

    local saturation
    -- if lightness <= 0.5 then
    --     saturation = chroma / (c_min + c_max)
    -- else
    --     saturation = chroma / (2 - c_max - c_min)
    -- end
    if lightness == 1 or lightness == 0 then
        saturation = 0
    else
        saturation = chroma / (1 - math.abs(2 * lightness - 1))
    end
    hsl.s = saturation

    return hsl
end

---@param hsl HSL
---@return RGB
local function hsl_to_rgb(hsl)
    local r, g, b
    local chroma = (1 - math.abs(2 * hsl.l - 1)) * hsl.s
    local h_prime = hsl.h / 60
    local x = chroma * (1 - math.abs(math.fmod(h_prime, 2) - 1))

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

    local m = hsl.l - (chroma / 2)
    r, g, b = r + m, g + m, b + m
    return { r = r, g = g, b = b }
end

--- Converts HSL color code to hex code
---@param hsl HSL
---@return string
local function hsl_to_hex(hsl)
    local rgb = hsl_to_rgb(hsl)
    return string.format("#%02x%02x%02x", rgb.r * 255, rgb.g * 255, rgb.b * 255)
end

--- Converts hex color code to HSL color code
---@param hex string
---@return HSL
local function hex_to_hsl(hex)
    return rgb_to_hsl(hex_to_rgb(hex))
end

-- TODO: need more intuitive function

--- Performs modifications on hex color code via HSL conversion
---@param hex string
---@param saturation number
---@param brightness number
---@return string
local function hex_mod(hex, saturation, brightness)
    local hsl = hex_to_hsl(hex)
    -- mod as pct of remaining diff, cap at 1
    hsl.s = math.min(hsl.s + (1 - hsl.s) * saturation, 1)
    hsl.l = math.min(hsl.l + (1 - hsl.l) * brightness, 1)
    return hsl_to_hex(hsl)
end

M.palette = {
    -- mountain fuji theme
    yuki = "#f0f0f0", -- fg
    fuyu = "#cacaca",
    tsuki = "#bfbfbf",
    okami = "#a0a0a0",
    gin = "#767676",
    amagumo = "#4c4c4c",
    tetsu = "#393939",
    iwa = "#262626",
    kesseki = "#191919",
    yoru = "#0f0f0f",

    usagi = "#e7e7e7",
    ume = "#8f8aac",
    kosumosu = "#ac8aac",
    chikyu = "#aca98a",
    yellow = "#ab9a78",
    kaen = "#ac8a8c",
    red = "#b36d7c",
    dusty_red = "#c48282",
    aki = "#c6a679",
    yuyake = "#ceb188",
    orange = "#c59a5f",
    mizu = "#8aacab",
    take = "#8aac8b",
    -- green = "#789978",
    green = "#778c73", -- duller
    shinkai = "#8a98ac",
    kori = "#a5b4cb",
    blue = "#7e97ab",
    moon = "#aeaed1",
    -- bluelsf = "#7ba6de",
    -- bluewjsn = "#002f6c",
    -- mint = "#b4d4cf",
}

M.colors = {
    none = "none",
    Red = "#ff0000",
    Magenta = "#ff00ff",
    Lime = "#00ff00",
    moon = hex_mod(M.palette.moon, config.opts.saturation, config.opts.brightness),

    fg = hex_mod(M.palette.fuyu, config.opts.saturation, config.opts.brightness),
    fg_mid = hex_mod(M.palette.tsuki, config.opts.saturation, config.opts.brightness),
    fg_dark = hex_mod(M.palette.okami, config.opts.saturation, config.opts.brightness),
    fg_comment = hex_mod(M.palette.amagumo, config.opts.saturation, config.opts.brightness),

    bg = hex_mod(M.palette.yoru, config.opts.saturation, config.opts.brightness),
    bg_float = hex_mod(M.palette.kesseki, config.opts.saturation, config.opts.brightness),
    bg_visual = hex_mod(M.palette.tetsu, config.opts.saturation, config.opts.brightness),
    cursor_line = hex_mod(M.palette.iwa, config.opts.saturation, config.opts.brightness),

    gray0 = hex_mod(M.palette.okami, config.opts.saturation, config.opts.brightness),
    gray1 = hex_mod(M.palette.gin, config.opts.saturation, config.opts.brightness),
    gray2 = hex_mod(M.palette.amagumo, config.opts.saturation, config.opts.brightness),
    gray3 = hex_mod(M.palette.tetsu, config.opts.saturation, config.opts.brightness),
    gray4 = hex_mod(M.palette.iwa, config.opts.saturation, config.opts.brightness),
    gray5 = hex_mod(M.palette.kesseki, config.opts.saturation, config.opts.brightness),

    purple = hex_mod(M.palette.ume, config.opts.saturation, config.opts.brightness),
    pink = hex_mod(M.palette.kosumosu, config.opts.saturation, config.opts.brightness),
    yellow = hex_mod(M.palette.chikyu, config.opts.saturation, config.opts.brightness),
    red = hex_mod(M.palette.red, config.opts.saturation, config.opts.brightness),
    red_diff = hex_mod(M.palette.red, config.opts.saturation, -0.8),
    orange = hex_mod(M.palette.aki, config.opts.saturation, config.opts.brightness),
    green = hex_mod(M.palette.green, config.opts.saturation, config.opts.brightness),
    green_diff = hex_mod(M.palette.green, config.opts.saturation, -0.75),
    blue = hex_mod(M.palette.blue, config.opts.saturation, config.opts.brightness),
    blue_diff = hex_mod(M.palette.blue, config.opts.saturation, -0.75),
}

return M
