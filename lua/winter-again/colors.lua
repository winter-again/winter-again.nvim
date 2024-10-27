local palette = {
    -- mountain fuji theme
    yuki = "#f0f0f0",
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
    orange = "#c59a5f",
    mizu = "#8aacab",
    cyan = "#708090",
    -- cyan = "#7b9695", -- test
    take = "#8aac8b",
    green = "#789978",
    shinkai = "#8a98ac",
    blue = "#7e97ab",
    -- bluelsf = "#7ba6de",
    -- bluewjsn = "#002f6c",
}

local M = {
    none = "none",
    Red = "#ff0000",
    Magenta = "#ff00ff",
    Lime = "#00ff00",

    fg = palette.yuki,
    fg_dark = palette.gin,
    fg_comment = palette.amagumo,

    bg = palette.yoru,
    bg_float = palette.kesseki,
    bg_visual = palette.tetsu,
    cursor_line = palette.iwa,

    gray0 = palette.gin,
    gray1 = palette.amagumo,
    gray2 = palette.tetsu,
    gray3 = palette.iwa,

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
